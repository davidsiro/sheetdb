package com.siro.sheetdb.grails.domain

class Drawing {
	
	static belongsTo = Product
	
	String code
	String description
	Date created
	String fileName /* drawings will be stored in filesystem */

    static constraints = {
    }
}
