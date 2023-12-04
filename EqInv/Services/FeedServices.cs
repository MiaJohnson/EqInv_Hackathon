using EqInv.Interfaces;
using EqInv.Models;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using SQLite;

namespace EqInv.Services
{
  public class FeedServices : IFeedService
  {
    private SQLiteAsyncConnection conn;
    readonly ILogger<FeedServices> _logger;

    public FeedServices(ILogger<FeedServices> logger)
    {
      _logger = logger;
    }


    public static string GetLocalFilePath(string filename)
    {
      return Path.Combine(FileSystem.AppDataDirectory, filename);
    }


    async Task Init()
    {
      try
      {
        _logger.LogInformation($"FeedServices.Init");
        if (conn != null)
          return;

        string _dbPath = GetLocalFilePath("EqInv.db3");

        conn = new SQLiteAsyncConnection(_dbPath);
        await conn.CreateTableAsync<GrainModel>();
      }
      catch (Exception ex)
      {
        var message = $"Init. Exception: {ex}";
        _logger.LogError("{Message}", message);
      }
    }


    public async Task<IEnumerable<GrainModel>> GetAllGrains_OrderDateDesc()
    {
      try
      {
        _logger.LogInformation($"FeedServices.GetAllGrains_OrderDateDesc");

        await Init();
        return await conn.Table<GrainModel>().OrderByDescending(o => o.PurchaseDate).ToListAsync();
      }
      catch (Exception ex)
      {
        var message = $"GetAllGrains_OrderDateDesc. Exception: {ex}";
        _logger.LogError("{Message}", message);
      }
      return new List<GrainModel>();
    }


    public async Task<IEnumerable<GrainModel>> GetAllGrains_OrderDateAsc()
    {
      try
      {
        _logger.LogInformation($"FeedServices.GetAllGrains_OrderDateAsc");

        await Init();
        return await conn.Table<GrainModel>().OrderBy(o => o.PurchaseDate).ToListAsync();
      }
      catch (Exception ex)
      {
        var message = $"GetAllGrains_OrderDateAsc. Exception: {ex}";
        _logger.LogError("{Message}", message);
      }
      return new List<GrainModel>();
    }

    public async Task<int> QuantityForMonth(int month)
    {
     
      try
      {
        _logger.LogInformation($"FeedServices.QuantityForMonth");

        await Init();
        var monthItems = await conn.Table<GrainModel>().Where(w => w.PurchaseDate.Value.Month == month).ToListAsync();
        var qtyTotal = monthItems.Sum(s => s.Quantity);
        return qtyTotal is null ? 0 : (int)qtyTotal;
      }
      catch (Exception ex)
      {
        var message = $"QuantityForMonth. Exception: {ex}";
        _logger.LogError("{Message}", message);
      }
      return 0;
    }

    public async Task<decimal> TotalCostForMonth(int month)
    {
      decimal cost = 0;
      try
      {
        _logger.LogInformation($"FeedServices.TotalCostForMonth");

        await Init();
        var monthItems = await conn.Table<GrainModel>().Where(w => w.PurchaseDate.Value.Month == month).ToListAsync();
        var costs = monthItems.Sum(s => s.TotalPrice);
        return cost;
      }
      catch (Exception ex)
      {
        var message = $"TotalCostForMonth. Exception: {ex}";
        _logger.LogError("{Message}", message);
      }
      return cost;
    }

    public async Task<int> QuantityForYear(int year)
    {
      try
      {
        _logger.LogInformation($"FeedServices.QuantityForYear");

        await Init();
        var monthItems = await conn.Table<GrainModel>().Where(w => w.PurchaseDate.Value.Year == year).ToListAsync();
        var qtyTotal = monthItems.Sum(s => s.Quantity);
        return qtyTotal is null ? 0 : (int)qtyTotal;
      }
      catch (Exception ex)
      {
        var message = $"QuantityForYear. Exception: {ex}";
        _logger.LogError("{Message}", message);
      }
      return 0;
    }

    public async Task<decimal> TotalCostForYear(int year)
    {
      decimal cost = 0;
      try
      {
        _logger.LogInformation($"FeedServices.TotalCostForMonth");

        await Init();
        var monthItems = await conn.Table<GrainModel>().Where(w => w.PurchaseDate.Value.Year == year).ToListAsync();
        var costs = monthItems.Sum(s => s.TotalPrice);
        return cost;
      }
      catch (Exception ex)
      {
        var message = $"TotalCostForMonth. Exception: {ex}";
        _logger.LogError("{Message}", message);
      }
      return cost;
    }

    public async Task<int> DiffInQtyBetwnCurrentPriorYear(int year)
    {
      try
      {
        _logger.LogInformation($"FeedServices.DiffInQtyBetwnCurrentPriorYear");

        var currentQty = await QuantityForYear(year);
        var priorQty = await QuantityForYear(year - 1);
        var diff = currentQty - priorQty;
        return diff;

      }
      catch (Exception ex)
      {
        var message = $"DiffInQtyBetwnCurrentPriorYear. Exception: {ex}";
        _logger.LogError("{Message}", message);
      }
      return 0;
    }

    public async Task<decimal> DiffInCostBetwnCurrentPriorYear(int year)
    {
      try
      {
        _logger.LogInformation($"FeedServices.DiffInQtyBetwnCurrentPriorYear");

        var currentCosts = await TotalCostForYear(year);
        var priorCosts = await TotalCostForYear(year - 1);
        var diff = currentCosts - priorCosts;
        return diff;

      }
      catch (Exception ex)
      {
        var message = $"DiffInQtyBetwnCurrentPriorYear. Exception: {ex}";
        _logger.LogError("{Message}", message);
      }
      return 0.0m;
    }

    public async Task<int> AddOrUpdateGrain(GrainModel grain)
    {
      try
      {
        int cnt;
       

        await Init();
        _logger.LogInformation($"FeedServices.AddGrain");
        if (grain is null) return 0;
        grain.TaxAmount ??= 0;
        grain.DeliveryCost ??= 0;
        grain.PricePerItem ??= 0;
        grain.WeightPerItem ??= 0;
        grain.Manufacturer ??= string.Empty;
        grain.ProductName ??= string.Empty;
        grain.PurchaseDate ??= DateTime.Now;

        if (grain.GrainId == 0)
        {
          cnt = await conn.InsertAsync(grain);
        }
       else{
          cnt = await conn.UpdateAsync(grain);
        }
        if (cnt > 0)
          return grain.GrainId;
      }
      catch (Exception ex)
      {
        var message = $"AddGrain. Exception: {ex}";
        _logger.LogError("{Message}", message);
      }
      return 0;
    }


    public async Task<int> DeleteGrain(GrainModel grain)
    {
      int cnt = 0;
      try
      {
        _logger.LogInformation($"FeedServices.DeleteGrain");

        await Init();
        if (grain is not null)
        {
        cnt = await conn.DeleteAsync(grain);
        }
        return cnt;
      }
      catch (Exception ex)
      {
        var message = $"DeleteGrain. Exception: {ex}";
        _logger.LogError("{Message}", message);
      }
      return 0;
    }

    public async Task<GrainModel> GetGrainModelById(int id)
    {
      try
      {
        _logger.LogInformation($"FeedServices.GetGrainModelById");
        if (id == 0) return new GrainModel();

        await Init();
        return await conn.Table<GrainModel>().Where(w => w.GrainId == id).FirstOrDefaultAsync();
        
      }
      catch (Exception ex)
      {
        var message = $"GetGrainModelById. Exception: {ex}";
        _logger.LogError("{Message}", message);
      }
      return new GrainModel();
    }
  }
}
