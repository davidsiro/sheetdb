package com.siro.sheetdb.grails.domain

class Drawing {
	
	String code
	String description
	Date created
	String fileName /* drawings will be stored in filesystem */
	Product assignedProduct = null

    static constraints = {
    }
}
