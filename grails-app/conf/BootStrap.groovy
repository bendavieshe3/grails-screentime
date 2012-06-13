import screentime.Page

class BootStrap {

    def init = { servletContext ->
		
		//check whether the test data already exists
		if(!Page.count()) {
			
			new Page(pageName:"JQuery Mobile",pageUrl:"http://jquerymobile.com",pageOrder:1).save(failOnError:true)
			new Page(pageName:"Grails",pageUrl:"http://grails.org",pageOrder:2).save(failOnError:true)
			new Page(pageName:"Spine JS", pageUrl:"http://spinejs.com", pageOrder:3).save(failOnError:true)
			new Page(pageName:"Grails Jira Task Board", pageUrl:"http://jira.grails.org/secure/TaskBoard.jspa?type=TB&selectedProjectId=10020&selectedBoardId=13125&start=0", pageOrder:4).save(failOnError:true)
			new Page(pageName:"Jenkins CI", pageUrl:"http://ci.jenkins-ci.org/view/All/", pageOrder:5).save(failOnError:true)
		}
		
    }
    def destroy = {
    }
}
