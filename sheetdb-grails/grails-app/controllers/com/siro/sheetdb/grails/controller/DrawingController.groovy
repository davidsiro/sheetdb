package com.siro.sheetdb.grails.controller

import java.awt.print.Printable;

import com.siro.sheetdb.grails.domain.Drawing
import grails.converters.JSON

class DrawingController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST", saveAsync: "POST"]

	def index = {
		redirect(action: "list", params: params)
	}

	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[drawingInstanceList: Drawing.list(params), drawingInstanceTotal: Drawing.count()]
	}

	def create = {
		def drawingInstance = new Drawing()
		drawingInstance.properties = params
		return [drawingInstance: drawingInstance]
	}

	def save = {
		def drawingInstance = new Drawing(params)
		if (drawingInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'drawing.label', default: 'Drawing'), drawingInstance.id])}"
			redirect(action: "show", id: drawingInstance.id)
		}
		else {
			render(view: "create", model: [drawingInstance: drawingInstance])
		}
	}

	def show = {
		def drawingInstance = Drawing.get(params.id)
		if (!drawingInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'drawing.label', default: 'Drawing'), params.id])}"
			redirect(action: "list")
		}
		else {
			[drawingInstance: drawingInstance]
		}
	}

	def edit = {
		def drawingInstance = Drawing.get(params.id)
		if (!drawingInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'drawing.label', default: 'Drawing'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [drawingInstance: drawingInstance]
		}
	}

	def update = {
		def drawingInstance = Drawing.get(params.id)
		if (drawingInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (drawingInstance.version > version) {

					drawingInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'drawing.label', default: 'Drawing')]
					as Object[], "Another user has updated this Drawing while you were editing")
					render(view: "edit", model: [drawingInstance: drawingInstance])
					return
				}
			}
			drawingInstance.properties = params
			if (!drawingInstance.hasErrors() && drawingInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'drawing.label', default: 'Drawing'), drawingInstance.id])}"
				redirect(action: "show", id: drawingInstance.id)
			}
			else {
				render(view: "edit", model: [drawingInstance: drawingInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'drawing.label', default: 'Drawing'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete = {
		def drawingInstance = Drawing.get(params.id)
		if (drawingInstance) {
			try {
				drawingInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'drawing.label', default: 'Drawing'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'drawing.label', default: 'Drawing'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'drawing.label', default: 'Drawing'), params.id])}"
			redirect(action: "list")
		}
	}

	def saveAsync = {
		def drawingInstance = new Drawing(params)
		try {
//			save causes problem, probably mandatory association to product
						if (drawingInstance.save(flush: true))
				render(template: "/drawing/preview", model: [drawing: drawingInstance])
		}
		catch(Exception e) {
			print(e)
		}
	}
}
