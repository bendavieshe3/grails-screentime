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
		
		def postData = request.JSON?request.JSON:params
		
		def page = new Page(postData)

		if(page.save()) {
			render text:(page as JSON), status:201	
		} else {
			render text:(page.errors as JSON),status:400
		}
		
	}
}
