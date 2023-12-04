using CommunityToolkit.Maui;
using EqInv.Helpers;
using EqInv.Services;
using EqInv.ViewModels;
using EqInv.Views;
using MetroLog.MicrosoftExtensions;
using Microsoft.Extensions.Logging;

namespace EqInv
{
  public static class MauiProgram
  {
    public static MauiApp CreateMauiApp()
    {
      var builder = MauiApp.CreateBuilder();
      builder
        .UseMauiApp<App>()
        .UseMauiCommunityToolkit()        
        .ConfigureFonts(fonts =>
        {
          fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
          fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
        });

      builder.Services.AddTransient<FeedServices>();
      builder.Services.AddTransient<GrainCostTrackingViewModel>();
      builder.Services.AddTransient<GrainCostTrackingPage>();
      builder.Services.AddTransient<GrainCostTrackingDetailPage>();
      builder.Services.AddTransient<GrainCostTrackingDetailViewModel>();


      builder.Logging
        .SetMinimumLevel(LogLevel.Debug) // IMPORTANT: set your minimum log level, here Trace
        .AddTraceLogger(
            options =>
            {
              options.MinLevel = LogLevel.Debug;
              options.MaxLevel = LogLevel.Critical;
            }) // Will write to the Debug Output
        .AddConsoleLogger(
            options =>
            {
              options.MinLevel = LogLevel.Debug;
              options.MaxLevel = LogLevel.Critical;
            }) // Will write to the Console Output (logcat for android)
        .AddInMemoryLogger(
            options =>
            {
              options.MaxLines = 1024;
              options.MinLevel = LogLevel.Debug;
              options.MaxLevel = LogLevel.Critical;
            })
        .AddStreamingFileLogger(
            options =>
            {
              options.RetainDays = 2;
              options.Layout = new SimpleLoggingLayout();
              options.FolderPath = Path.Combine(
                  FileSystem.AppDataDirectory,
                  "MetroLogs");
            });


#if DEBUG
      //  builder.Logging.AddDebug();

#endif

      return builder.Build();
    }



  }
}
