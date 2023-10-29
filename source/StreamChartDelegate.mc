import Toybox.Communications;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Time;
import Toybox.Background;
import Toybox.System;
import GlucoseData;

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
        Communications.makeWebRequest(
            "http://localhost:1080/api/v2/properties/bgnow,rawbg,delta",
            {},
            options,
            method(:onReceive)
        );
    }

	public function type_name(obj) {
    if (obj instanceof Toybox.Lang.Number) {
        return "Number";
    } else if (obj instanceof Toybox.Lang.Long) {
        return "Long";
    } else if (obj instanceof Toybox.Lang.Float) {
        return "Float";
    } else if (obj instanceof Toybox.Lang.Double) {
        return "Double";
    } else if (obj instanceof Toybox.Lang.Boolean) {
        return "Boolean";
    } else if (obj instanceof Toybox.Lang.String) {
        return "String";
    } else if (obj instanceof Toybox.Lang.Array) {
        var s = "Array [";
        for (var i = 0; i < obj.size(); ++i) {
            s += type_name(obj);
            s += ", ";
        }
        s += "]";
        return s;
    } else if (obj instanceof Toybox.Lang.Dictionary) {
        var s = "Dictionary{";
        var keys = obj.keys();
        var vals = obj.values();
        for (var i = 0; i < keys.size(); ++i) {
            s += keys;
            s += ": ";
            s += vals;
            s += ", ";
        }
        s += "}";
        return s;
    } else if (obj instanceof Toybox.Time.Gregorian.Info) {
        return "Gregorian.Info";
    } else {
        return "???";
    }
}

	public function parseData(data as Dictionary) {
		var myDatas = {};
		var dataToAdd = data["bgnow"]["sgvs"] as Array;
		for(var i=0; i < dataToAdd.size(); ++i) {
			myDatas.put(dataToAdd[i].get("mills"), dataToAdd[i].get("mgdl"));
		}
		dataToAdd = data["delta"]["previous"]["sgvs"] as Array;
		for(var i=0; i < dataToAdd.size(); ++i) {
			myDatas.put(dataToAdd[i].get("mills"), dataToAdd[i].get("mgdl"));
		}
	}

	public function onReceive(responseCode as Number, data as  Dictionary or String or Null) as Void{
		System.println("totot");
		System.println("receive data ");
		if (responseCode == 200) {
			System.println("200");
			//System.println(data);
			parseData(data);
			//   _notify.invoke(data);
		} else {
			System.println("djzeljdzelkdez");
			//   _notify.invoke("Failed to load\nError: " + responseCode.toString());
		}
	}
} 