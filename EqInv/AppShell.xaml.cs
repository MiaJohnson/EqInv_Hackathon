using EqInv.Views;

namespace EqInv
{
  public partial class AppShell : Shell
  {
    public AppShell()
    {
      InitializeComponent();
      Routing.RegisterRoute(nameof(GrainCostTrackingDetailPage), typeof(GrainCostTrackingDetailPage));
    }
  }
}
