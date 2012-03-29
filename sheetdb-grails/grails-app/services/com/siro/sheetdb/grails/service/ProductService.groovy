package com.siro.sheetdb.grails.service

import com.siro.sheetdb.grails.domain.Product

class ProductService {

    static transactional = true

    def createProduct(Product product) {
		product.created = new Date()
		
		//since no cascading enabled - each object must be manually saved
		product.drawings.each {
			it.assignedProduct = product
			it.save()
		}
		
		return product.save(flush: true)
	}	
	
}
