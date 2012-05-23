package screentime

import java.util.logging.Logger;
import java.util.logging.Logging;

import grails.converters.JSON

class PageController {

    def list() {
		render Page.list(sort:"pageOrder") as JSON	
	}
	
	def show(id) {

		log.warn('hello')
		println 'hello'
		
		render Page.get(id) as JSON
	}
	
	def update(id) {
		def page = Page.get(id)
		bindData(page, params)
		
		render page as JSON
	}
	
	def delete(id) {
		Page.get(id).delete()
	}
	
	def save() {
		def page = new Page()
		bindData(page, params)
		page.save()
		
		render page as JSON
	}
}
