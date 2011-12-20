package com.siro.sheetdb.grails.domain

class Product {
	
	static hasMany = [drawings : Drawing]
	
	String code
	String name
	String description
	BigDecimal price
	Date created
	
    static constraints = {
    }
}
