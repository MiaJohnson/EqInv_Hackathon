using EqInv.Models;

namespace EqInv.Interfaces;

public interface IFeedService
{


  Task<IEnumerable<GrainModel>> GetAllGrains_OrderDateDesc();
  Task<IEnumerable<GrainModel>> GetAllGrains_OrderDateAsc();
  Task<GrainModel> GetGrainModelById(int id);

  Task<int> QuantityForMonth(int month);
  Task<decimal> TotalCostForMonth(int month);

  Task<int> QuantityForYear(int year);  
  Task<decimal>TotalCostForYear(int year);

  Task<int> DiffInQtyBetwnCurrentPriorYear(int year);
  Task<decimal> DiffInCostBetwnCurrentPriorYear(int year);


  Task<int> AddOrUpdateGrain(GrainModel grain);
  Task<int> DeleteGrain(GrainModel grain);




}

