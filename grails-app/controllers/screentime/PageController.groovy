package screentime

import grails.converters.JSON

class PageController {

    def list() {
		render Page.list(sort:"pageOrder") as JSON	
	}
	
	def show() {
		render Page.get(params.id) as JSON
	}
	
	def update() {
		def page = Page.get(params.id)
		bindData(page, params, excludes:'id')
		
		render page as JSON
	}
	
	def delete() {
		Page.get(params.id).delete()
		render(status:204)
	}
	
	def save() {
		def page = new Page()
		bindData(page, params, excludes:'id')
		page.save()
		
		render(model:page,status:201) as JSON
	}
}
