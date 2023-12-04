using CommunityToolkit.Mvvm.ComponentModel;
using EqInv.Models;
using EqInv.Services;
using Microsoft.Extensions.Logging;
using CommunityToolkit.Mvvm.Input;
using CommunityToolkit.Maui.Alerts;
using CommunityToolkit.Maui.Core;
using System.Threading;

namespace EqInv.ViewModels
{
  [QueryProperty(nameof(GrainItem), "grainModelItem")]
  public partial class GrainCostTrackingDetailViewModel : ObservableObject
  {
    readonly FeedServices dataService;
    readonly ILogger<GrainCostTrackingDetailViewModel> _logger;
    CancellationTokenSource cancellationTokenSource = new CancellationTokenSource();

    [ObservableProperty]
    bool isRefreshing;

    [ObservableProperty]
    GrainModel grainItem;


    public GrainCostTrackingDetailViewModel(FeedServices service, ILogger<GrainCostTrackingDetailViewModel> logger)
    {
      dataService = service;
      _logger = logger;
    }


    [RelayCommand]
    private async Task OnRefreshing()
    {
      IsRefreshing = true;
      _logger.LogInformation($"Services.GrainCostTrackingDetailViewModel.OnRefreshing");
      try
      {
        await LoadDataAsync();
      }
      finally
      {
        IsRefreshing = false;
      }
    }


    public async Task LoadDataAsync()
    {
      _logger.LogInformation($"Services.GrainCostTrackingDetailViewModel.LoadDataAsync");
      try
      {
        if (GrainItem is null)
        {
          _logger.LogWarning($"GrainItem is null");
          return;
        }
        var id = GrainItem.GrainId;
        GrainItem = await dataService.GetGrainModelById(id);
        await ShowToastAsync("Inventory is HERE");
      }
      catch (Exception ex)
      {
        var message = $"LoadDataAsync. Exception: {ex}";
        _logger.LogError("{Message}", message);
      }
    }

    [RelayCommand]
    public async Task AddOrUpdateGrain(GrainModel grainModel)
    {
      try
      {
        _logger.LogInformation($"Services.GrainCostTrackingDetailViewModel.AddOrUpdateGrain");
        IsRefreshing = true;
        if (grainModel is null){
        grainModel = new GrainModel();
        }
        int id = await dataService.AddOrUpdateGrain(grainModel);
        if (GrainItem.GrainId == 0 || GrainItem.GrainId != id) 
        {
          GrainItem.GrainId = id;
          await OnRefreshing();
        }       

         await ShowToastAsync("Inventory updated");
      }
      catch (Exception ex)
      {
        var message = $"AddOrUpdateGrain. Exception: {ex}";
        _logger.LogError("{Message}", message);
      }
      finally
      {
        IsRefreshing = false;
      }

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
