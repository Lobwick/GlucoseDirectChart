 module StreamChart {
   using Toybox.Graphics;  
   using Toybox.Math;
   import Axes;
   using ChartInitialization;
   using Toybox.System;
   import Geometry;
   using MathHelpers as Mh;
   //using ChartInterpolation as Ci;
 
   class Chart {
     hidden var options;
             
     // axis                         
     hidden var xAxis;
     hidden var yAxis;
          
     // dimensions
     hidden var corners;
     hidden var deviceScreenInfo;
     
     hidden var chartDataLine;
          
     function initialize(dc, options) {         
       self.options = options;       
       deviceScreenInfo = ChartInitialization.createDeviceScreenInfo(dc);
       corners = ChartInitialization.createCorners(deviceScreenInfo);
       createAxis();
     }
     
     function createAxis() {
     	xAxis = new XAxis(corners["bottomLeftCorner"], corners["bottomRightCorner"]) as XAxis;
     	yAxis = new YAxis(corners["bottomLeftCorner"], corners["topLeftCorner"]) as YAxis;    
     }
     
     
     function draw(dc) {            
        drawBackground(dc);        
     	     
//     	var maxY = corners["topLeftCorner"].y.toDouble();
     //	var minY = corners["bottomLeftCorner"].y.toDouble();
     	//var minX = corners["bottomLeftCorner"].x.toDouble();     	    	
     	
    // 	var interp = new Ci.Interpolator([0, 25, 50], [0, 50, 90]);
     	var allObservedValues = new [50];
        
     	for(var i=0; i < 50; ++i) {     		
     		var rand = Math.rand() % 200 + 1;
     		allObservedValues[i] = rand.toDouble();     		     		
     	}      	     	
     	
        chartDataLine = new ChartDataLine(allObservedValues, corners, xAxis, yAxis);
        chartDataLine.draw(dc);
        xAxis.draw(dc);
     	yAxis.draw(dc);                                         
     }
     
     function drawBackground(dc)  {
       dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
       dc.fillRectangle(0, 0, dc.getWidth(), dc.getHeight());
     }
       
   }
 }