import Toybox.Application;
import Toybox.WatchUi;
import Toybox.Lang;

class StreamChartApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        var view = new StreamChartView();
        var delegate = new StreamChartDelegate(view.method(:onReceive));
         return [view, delegate] as Array<Views or InputDelegates>;
    }

}