using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using EqInv.Models;
using EqInv.Services;
using EqInv.Views;
using Microsoft.Extensions.Logging;
using System.Collections.ObjectModel;
using CommunityToolkit.Maui.Alerts;
using CommunityToolkit.Maui.Core;

namespace EqInv.ViewModels
{
  public partial class GrainCostTrackingViewModel : ObservableObject
  {
    readonly FeedServices dataService;
    readonly ILogger<GrainCostTrackingViewModel> _logger;
    public List<GrainModel> SourceItems { get; set; } = new List<GrainModel>();
    CancellationTokenSource cancellationTokenSource = new CancellationTokenSource();

    [ObservableProperty]
    bool isRefreshing;

    [ObservableProperty]
    ObservableCollection<GrainModel> grainItems;

    [ObservableProperty]
    private GrainModel _selectedGrainModel;


    [ObservableProperty]
    ObservableCollection<GrainModel> _selectedGrainModels;

    [ObservableProperty]
    string summedCosts;

    [ObservableProperty]
    string summedQuantities;

  

    public GrainCostTrackingViewModel(FeedServices service, ILogger<GrainCostTrackingViewModel> logger)
    {
      dataService = service;
      _logger = logger;
    }



    [RelayCommand]
    private async Task SelectionChanged()
    {
      if (SelectedGrainModel != null)
      {
        await GoToDetails(SelectedGrainModel);
      }
    }


    [RelayCommand]
    private async Task GoToDetails(GrainModel selectedModel)
    {
      _logger.LogInformation($"Services.GrainCostTrackingViewModel.GoToDetails");

      try
      {
        var navigationParameter = SetupNavigationParams(selectedModel);
       
        _logger.LogInformation($"GoToDetails A");
       // var value = navigationParameter.Select(s => s.Value);

        await Shell.Current.GoToAsync(nameof(GrainCostTrackingDetailPage), navigationParameter);
        _logger.LogInformation($"GoToDetails B");
      }
      catch (Exception ex)
      {
        var message = $"GoToDetails. Exception: {ex}";
        _logger.LogError("{Message}", message);
      }
    }

    private static Dictionary<string, object> SetupNavigationParams(GrainModel grainItem)
    {
      if (grainItem is null) return new Dictionary<string, object>();

      // string is name we gave to access object passed.
      return new Dictionary<string, object>()
            {
                { "grainModelItem", grainItem }
            };
    }

    [RelayCommand]
    private async Task OnRefreshing()
    {
      IsRefreshing = true;

      _logger.LogInformation($"Services.GrainCostTrackingViewModel.OnRefreshing");
      try
      {
        await LoadDataAsync();
      }
      finally
      {
        IsRefreshing = false;

      }
    }

    [RelayCommand]
    private void FilterResults(string arg)

    {
      var searchTerm = arg.Trim();

      if (string.IsNullOrWhiteSpace(searchTerm))
      {
        searchTerm = string.Empty;
      }
      searchTerm = searchTerm.ToLowerInvariant();
      var filteredItems = SourceItems.Where(w => w.Manufacturer.Contains(searchTerm, StringComparison.InvariantCultureIgnoreCase) || w.ProductName.ToLowerInvariant().Contains(searchTerm)).ToList();

      foreach (var value in SourceItems)
      {
        if (!filteredItems.Contains(value) && GrainItems.Contains(value))
        {
          GrainItems.Remove(value);
        }
        else if (!GrainItems.Contains(value) && filteredItems.Contains(value))
        {
          GrainItems.Add(value);
        }
      }
    }

    [RelayCommand]
    public async Task DeleteGrainAsync(GrainModel grainModel)
    {
      int cntDeleted = 0;
      try
      {
        _logger.LogInformation($"Services.GrainCostTrackingViewModel.DeleteGrainAsync");

        bool keepSelection = await App.Current.MainPage.DisplayAlert(grainModel.Manufacturer + " " + grainModel.ProductName, "Delete this selection?", "Yes", "No");
        if (keepSelection)
        {
          cntDeleted = await dataService.DeleteGrain(grainModel);
        }
        if (cntDeleted > 0)
        {
          IsRefreshing = true;
          GrainItems.Remove(grainModel);
          await ShowToastAsync("Inventory Deleted");
        }
      }
      catch (Exception ex)
      {
        var message = $"DeleteGrainAsync. Exception: {ex}";
        _logger.LogError("{Message}", message);
      }
      finally { IsRefreshing = false; }

    }

    [RelayCommand]
    private async Task AddNewGrainModel()
    {
      _logger.LogInformation($"Services.GrainCostTrackingViewModel.AddNewGrainModel");
      await Shell.Current.GoToAsync(nameof(GrainCostTrackingDetailPage));
    }

    public async Task LoadDataAsync()
    {
      //FakeAddData();
      _logger.LogInformation($"Services.GrainCostTrackingViewModel.LoadDataAsync");
      SourceItems?.Clear();
      GrainItems?.Clear();
      GrainItems = new ObservableCollection<GrainModel>(await dataService.GetAllGrains_OrderDateAsc());
      SourceItems = GrainItems.ToList();

      TotalSummedCostWithFormatting();
      TotalSummedQuantitiesWithFormatting();
     // GetMonthQty(12);

      
    }

    //private void GetMonthQty(int month)
    //{
    
    //  var test1 = GrainItems.GroupBy(g => g.PurchaseDate.Value.Month).Select(g => new { Month = g.Key, qty = g.Sum(s => s.Quantity) });
    //  var test2 = test1.ToList();
    //  var test3 = test2.Where(w => w.Month == month);

    //}




    /// <summary>
    /// Formatting the total summed costs for all Grain inventory.
    /// Total Price includes: (Qty * Price) + Tax + Delivery Cost
    /// </summary>
    private void TotalSummedCostWithFormatting()
    {
      var totalCosts = GrainItems.Sum(s => s.TotalPrice);
      SummedCosts = totalCosts.ToString("C2");
    }

    /// <summary>
    /// Formatting the total summed quantities for all Grain inventory.
    /// </summary>
    private void TotalSummedQuantitiesWithFormatting()
    {
      int? initialTotalQuantities = GrainItems.Sum(s => s.Quantity);
      var summedQty = initialTotalQuantities is not null ? (int)initialTotalQuantities : 0;
      SummedQuantities = summedQty.ToString("N0");
    }

    private async Task ShowToastAsync(string message)
    {
      string text = message;
      ToastDuration duration = ToastDuration.Short;
      double fontSize = 14;

      var toast = Toast.Make(text, duration, fontSize);

      await toast.Show(cancellationTokenSource.Token);
    }



  }
}
