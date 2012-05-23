class UrlMappings {

	static mappings = {
		"/pages" (controller:"page", action:"list")
		"/pages/$id?" (resource:"page") 
		
		"/groups/$id" (resource:"group")


		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller:"dash")
		
		"500"(view:'/error')
	}
}
