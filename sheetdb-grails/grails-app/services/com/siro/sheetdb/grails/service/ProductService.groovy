package com.siro.sheetdb.grails.service

import com.siro.sheetdb.grails.domain.Product

class ProductService {

    static transactional = true

    def createProduct(Product product) {
		product.created = new Date()
		return product.save(flush: true)
	}	
	
}
