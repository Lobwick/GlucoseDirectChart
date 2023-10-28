import Toybox.Communications;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Time;
import Toybox.Background;
import Toybox.System;

class StreamViewDelegate  extends WatchUi.BehaviorDelegate {


	 public function initialize() {
		BehaviorDelegate.initialize();

	}

    public function onSelect() as Boolean {
		System.println("on menu");

		return true;
    }

	public function onMenu() as Boolean {
		System.println("on menu");

		return true;
    }


} 