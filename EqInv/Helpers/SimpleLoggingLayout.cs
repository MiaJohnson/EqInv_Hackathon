using MetroLog;
using Layout = MetroLog.Layouts.Layout;

namespace EqInv.Helpers
{
  public class SimpleLoggingLayout : Layout
  {
    public override string GetFormattedString(LogWriteContext context, LogEventInfo info)
    {
      //if (info is null) return "LogEventInfo info not defined";
      return $"{info.TimeStamp:g} - Location: {info.Logger}; Level: {info.Level}; Message: {info.Message}";
    }
  }
}
