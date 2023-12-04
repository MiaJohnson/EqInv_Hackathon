using EqInv.ViewModels;

namespace EqInv.Views;

public partial class GrainCostTrackingPage : ContentPage
{
  readonly GrainCostTrackingViewModel ViewModel;
  public GrainCostTrackingPage(GrainCostTrackingViewModel viewModel)
	{
		InitializeComponent();
		BindingContext = ViewModel = viewModel;
	}

  protected override async void OnNavigatedTo(NavigatedToEventArgs args)
  {
    base.OnNavigatedTo(args);

    await ViewModel.LoadDataAsync();
  }


}