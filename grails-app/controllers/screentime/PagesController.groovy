package screentime

import grails.converters.JSON

class PagesController {

    def get() {
		render Page.list(sort:"pageOrder") as JSON	
	}
}
