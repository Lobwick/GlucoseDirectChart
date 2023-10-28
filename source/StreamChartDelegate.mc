import Toybox.Communications;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Time;

class StreamChartDelegate extends WatchUi.BehaviorDelegate {
    private var _notify as Method(args as Dictionary or String or Array or  Null) as Void;

    public function initialize(handler as Method(args as Dictionary or String or Array or  Null) as Void) {
    BehaviorDelegate.initialize();
    _notify = handler;
  }
} 