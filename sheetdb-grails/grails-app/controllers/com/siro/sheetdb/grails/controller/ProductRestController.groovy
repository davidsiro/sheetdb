package com.siro.sheetdb.grails.controller

import com.siro.sheetdb.grails.domain.Product

class ProductRestController {

	static allowedMethods = [save: "POST"]

	//not to be used now
	def save(){
		def productInstance = new Product(params)
		if (productInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'product.label', default: 'Product'), productInstance.id])}"
			redirect(action: "show", id: productInstance.id)
		}
		else {
			render(view: "create", model: [productInstance: productInstance])
		}
	}
}
