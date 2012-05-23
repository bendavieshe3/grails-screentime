class UrlMappings {

	static mappings = {
		"/pages" (controller:"page", action:"list")
		"/pages/$id?" (resource:"page") {
			action = [GET: "show", PUT: "update", DELETE: "delete", POST: "save"]
		}
		"/groups/$id" (resource:"group")

		/*
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		*/
		"/"(view:"/index")
		"500"(view:'/error')
	}
}
