package com.siro.sheetdb.grails.service

import org.codehaus.groovy.grails.commons.ConfigurationHolder;
import org.codehaus.groovy.grails.commons.GrailsApplication;

import com.siro.sheetdb.grails.domain.Drawing

class DrawingService {
	
	GrailsApplication grailsApplication
	def fileStore = grailsApplication.config.sheetdb.filestore

	static transactional = true

	Drawing createNewDrawing(Drawing drawing, String filename) {
		drawing.created = new Date();

		if(filename != null) {
			File drawingFile = new File(fileStore,filename);
			if(!drawingFile.exists())
				throw new IllegalArgumentException(filename + " does not exists, cannot save drawing");
			drawing.save(flush:true)
			drawingFile.renameTo(new File(fileStore,drawing.id +"_"+filename))
		}

		drawing.save(flush: true)
		
		return drawing;
	}
}
