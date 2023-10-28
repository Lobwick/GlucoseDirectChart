import Toybox.Communications;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Time;
import Toybox.Background;
import Toybox.System;

(:background)
class StreamChartDelegate  extends System.ServiceDelegate {
	//private var _notify as Method(args as Dictionary or String or Array or  Null) as Void;


	 public function initialize() {
		ServiceDelegate.initialize();
		System.println("init delegate");
		//_notify = handler;
	}

    public function onSelect() as Boolean {
		System.println("on menu");

		return true;
    }

	public function onMenu() as Boolean {
		System.println("on menu");

		return true;
    }


     public function onTemporalEvent() as Void {
		System.println("on temporal");
		makeRequest();
		// Do fun stuff here
    }

     //! Make the web request
    private function makeRequest() as Void {

        var options = {
            :responseType => Communications.HTTP_RESPONSE_CONTENT_TYPE_JSON,
            :headers => {
                "Content-Type" => Communications.REQUEST_CONTENT_TYPE_URL_ENCODED
            }
        };
        System.println("make request");
                //http://ip.jsontest.com/
                //"https://jsonplaceholder.typicode.com/todos/115",
				//"http://ip.jsontest.com",
				
        Communications.makeWebRequest(
            "http://localhost:1080/api/v2/properties/bgnow,rawbg,delta",
            {},
            options,
            method(:onReceive)
        );
    }

	public function onReceive(responseCode as Number, data as  Dictionary or String or Null) as Void{
		System.println("totot");
		System.println("receive data ");
		if (responseCode == 200) {
			System.println("200");
			System.println(data);
			//   _notify.invoke(data);
		} else {
			System.println("djzeljdzelkdez");
			//   _notify.invoke("Failed to load\nError: " + responseCode.toString());
		}
	}
} 