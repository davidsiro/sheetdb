package com.siro.sheetdb.grails.controller

import com.siro.sheetdb.grails.domain.Drawing
import com.siro.sheetdb.grails.service.DrawingService;

import grails.converters.JSON

class DrawingRestController {

	DrawingService drawingService
	
	static allowedMethods = [save: "POST", show: "GET"]

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
		
		drawingInstance = drawingService.createNewDrawing(drawingInstance, params.drawingFile)
		render drawingInstance as JSON
	}
}
