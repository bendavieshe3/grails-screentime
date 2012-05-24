import screentime.Page

class BootStrap {

    def init = { servletContext ->
		
		//check whether the test data already exists
		if(!Page.count()) {
			
			new Page(pageName:"Brisbane Radar",pageUrl:"http://www.bom.gov.au/products/IDR663.loop.shtml",pageOrder:1).save(failOnError:true)
			new Page(pageName:"Brisbane Forecast",pageUrl:"http://www.bom.gov.au/qld/forecasts/brisbane.shtml",pageOrder:2).save(failOnError:true)
			
			new Page(pageName:"HTTP Status Codes", pageUrl:"http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html", pageOrder:3).save(failOnError:true)
			new Page(pageName:"Learning Technical Stuff", pageUrl:"http://www.learningtechnicalstuff.com", pageOrder:4).save(failOnError:true)	
		}
		
    }
    def destroy = {
    }
}
