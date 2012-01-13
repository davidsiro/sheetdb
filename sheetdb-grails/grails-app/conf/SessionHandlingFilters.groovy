import org.apache.catalina.Session;
import com.siro.sheetdb.grails.util;

class SessionHandlingFilters {
	def filters = {
		clearDrawingsToAdd(controller: "product", action: "create|edit|createProduct|update"){
			after = { Map model ->
				session[SessionKeys]
			}
		}
	}
}
