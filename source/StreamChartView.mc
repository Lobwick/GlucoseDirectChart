import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;

class StreamChartView extends WatchUi.DataField {
  
    var chart;

    function initialize() {
        DataField.initialize();
    }

    public function onReceive(args as Dictionary or String or Array or Null) as Void {
        System.println("on receive view");
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
        chart = new StreamChart.Chart(dc, null);   
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        chart.draw(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

}
