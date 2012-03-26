package com.siro.sheetdb.grails.controller

import com.siro.sheetdb.grails.domain.Drawing
import grails.converters.JSON

class DrawingRestController {

	def show() {
		def drawingInstance = Drawing.get(params.id)
		if (!drawingInstance) {
			response.status = 404
		}
		else {
			render drawingInstance as JSON
		}
	}

	def save() {
		def drawingInstance = new Drawing(params)
		if (drawingInstance.save(flush: true))
			render drawingInstance as JSON

		//			render(template: "/drawing/preview", model: [drawing: drawingInstance])
	}
}
