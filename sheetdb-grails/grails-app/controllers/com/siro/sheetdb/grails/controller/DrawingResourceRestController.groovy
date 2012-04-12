package com.siro.sheetdb.grails.controller

import grails.converters.JSON
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest

import uk.co.desirableobjects.ajaxuploader.AjaxUploaderService

class DrawingResourceRestController {

	AjaxUploaderService ajaxUploaderService
	
	def index() {
	}

	def save() {
		println "I am here"
		
		String fileStorePath =  grailsApplication.config.sheetdb.filestore
		String fileName = params.qqfile;
		
		//TODO: handle multiple uploads of the same file
		File file = new File(fileStorePath, fileName);
		
		ajaxUploaderService.upload(request.inputStream, file)
		println "File uploaded to:" + file.getAbsolutePath()
		
		render(text: [success:true] as JSON)
	}
	
	private InputStream selectInputStream(HttpServletRequest request) {
		if (request instanceof MultipartHttpServletRequest) {
			MultipartFile uploadedFile = ((MultipartHttpServletRequest) request).getFile('qqfile')
			return uploadedFile.inputStream
		}
		return request.inputStream
	}
}
