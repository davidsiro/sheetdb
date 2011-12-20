

<%@ page import="com.siro.sheetdb.grails.domain.Drawing" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'drawing.label', default: 'Drawing')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${drawingInstance}">
            <div class="errors">
                <g:renderErrors bean="${drawingInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="code"><g:message code="drawing.code.label" default="Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: drawingInstance, field: 'code', 'errors')}">
                                    <g:textField name="code" value="${drawingInstance?.code}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="created"><g:message code="drawing.created.label" default="Created" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: drawingInstance, field: 'created', 'errors')}">
                                    <g:datePicker name="created" precision="day" value="${drawingInstance?.created}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="drawing.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: drawingInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${drawingInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fileName"><g:message code="drawing.fileName.label" default="File Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: drawingInstance, field: 'fileName', 'errors')}">
                                    <g:textField name="fileName" value="${drawingInstance?.fileName}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
