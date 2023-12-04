using EqInv.Models;
using EqInv.ViewModels;

namespace EqInv.Views;

public partial class GrainCostTrackingDetailPage : ContentPage
{
  GrainCostTrackingDetailViewModel ViewModel;
  public GrainCostTrackingDetailPage(GrainCostTrackingDetailViewModel viewModel)
  {
    InitializeComponent();
    BindingContext = ViewModel = viewModel;
  }

  protected override void OnNavigatedTo(NavigatedToEventArgs args)
  {
    base.OnNavigatedTo(args);
    if (ViewModel.GrainItem == null)
    {
      ViewModel.GrainItem = new GrainModel();
    }
  }

}
