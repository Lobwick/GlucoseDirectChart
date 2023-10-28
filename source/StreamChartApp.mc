import Toybox.Application;
import Toybox.WatchUi;
import Toybox.Lang;
import Toybox.Background;
import Toybox.System;

(:background)
var globalMember;
var _view;

(:background)
class StreamChartApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
         if(Background.getTemporalEventRegisteredTime() != null) {
            Background.registerForTemporalEvent(new Time.Duration(5 * 60));
        }
        // Initialize a global member
        $.globalMember = true;
    }

    // onStart() is called on application start up
    function onStart(state) {
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

     public function getServiceDelegate() as Array<ServiceDelegate>{
        return [new StreamChartDelegate()] as ServiceDelegate ;
    }


    // Return the initial view of your application here
    function getInitialView() {
        var view = new StreamChartView();
        var delegate = new StreamViewDelegate();
         return [view, delegate] as Array<Views or InputDelegate>;
    }

}