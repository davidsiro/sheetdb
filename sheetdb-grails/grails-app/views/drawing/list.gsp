
<%@ page import="com.siro.sheetdb.grails.domain.Drawing" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'drawing.label', default: 'Drawing')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'drawing.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="code" title="${message(code: 'drawing.code.label', default: 'Code')}" />
                        
                            <g:sortableColumn property="created" title="${message(code: 'drawing.created.label', default: 'Created')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'drawing.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="fileName" title="${message(code: 'drawing.fileName.label', default: 'File Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${drawingInstanceList}" status="i" var="drawingInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${drawingInstance.id}">${fieldValue(bean: drawingInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: drawingInstance, field: "code")}</td>
                        
                            <td><g:formatDate date="${drawingInstance.created}" /></td>
                        
                            <td>${fieldValue(bean: drawingInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: drawingInstance, field: "fileName")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${drawingInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
