import screentime.Page

class BootStrap {

    def init = { servletContext ->
		
		//check whether the test data already exists
		if(!Page.count()) {
			
			new Page(pageName:"Google",pageUrl:"http://www.google.com",pageOrder:1).save(failOnError:true)
			new Page(pageName:"Yahoo",pageUrl:"http://www.yahoo.com",pageOrder:2).save(failOnError:true)
			
		}
		
    }
    def destroy = {
    }
}
