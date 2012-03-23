class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		
		//rest api - will need to find a better way to dynamicaly resolved controller
		//classes from diferrent packages
		"/api/$controller/$id?"(controller: $controller+"Rest") { 
			action = [GET: "show", PUT: "update", DELETE: "delete", POST: "save"]
		}

		"/"(view:"/index")
		"500"(view:'/error')
	}
}
