package screentime

import grails.converters.JSON

class PagesController {

    def get() {
		render Page.list() as JSON	
	}
}
