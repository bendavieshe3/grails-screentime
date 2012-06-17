class UrlMappings {

	static mappings = {
		"/pages" (controller:"page", action:[GET:"list",POST:"save"])
		"/pages/$id?" (resource:"page") 
		
		"/groups/$id" (resource:"group")


		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		
		"/dash"(controller:"dash")
		
		"500"(view:'/error')
	}
}
