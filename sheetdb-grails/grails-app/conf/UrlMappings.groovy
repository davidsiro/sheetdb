class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{  
			constraints { 
				// apply constraints here
			}  
		}

		//rest api - will need to find a better way to dynamicaly resolved controller
		//classes from diferrent packages (not supported in Grails 2.x)
		//now using all controller from same package - REST controller must end with Rest suffix
		name restApi: "/api/$ctrlPrefix/$id?" {
			controller = {"${params.ctrlPrefix}Rest"}
			action = [GET: "show", PUT: "update", DELETE: "delete", POST: "save"]
		}

		"/"(view:"/index")
		"500"(view:'/error')
	}
}
