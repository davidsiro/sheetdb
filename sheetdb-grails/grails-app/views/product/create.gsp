

<%@ page import="com.siro.sheetdb.grails.domain.Product"%>
<%@ page import="com.siro.sheetdb.grails.domain.Drawing"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'product.label', default: 'Product')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<script type="text/javascript">
		$(function() {
				$("#addDrawingDialog").dialog({ autoOpen: false });
	
		    	$("#openAddDrawingDialog").click(function(){
		    		$("#addDrawingDialog").dialog('open');
		    		
		    		return false;
			    	});
	
		});
   	</script>
	<div id="addDrawingDialog" title="Add drawing">
		<g:render template="/drawing/createFormAjax"
			model="[drawingInstance: new Drawing()]"></g:render>
	</div>

	<div class="nav">
		<span class="menuButton"><a class="home"
			href="${createLink(uri: '/')}"><g:message
					code="default.home.label" /></a></span> <span class="menuButton"><g:link
				class="list" action="list">
				<g:message code="default.list.label" args="[entityName]" />
			</g:link></span>
	</div>
	<div class="body">
		<h1>
			<g:message code="default.create.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${productInstance}">
			<div class="errors">
				<g:renderErrors bean="${productInstance}" as="list" />
			</div>
		</g:hasErrors>
		<g:form action="createProduct">
			<div class="dialog">
				<table>
					<tbody>

						<tr class="prop">
							<td valign="top" class="name"><label for="code"><g:message
										code="product.code.label" default="Code" /></label></td>
							<td valign="top"
								class="value ${hasErrors(bean: productInstance, field: 'code', 'errors')}">
								<g:textField name="code" value="${productInstance?.code}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="description"><g:message
										code="product.description.label" default="Description" /></label></td>
							<td valign="top"
								class="value ${hasErrors(bean: productInstance, field: 'description', 'errors')}">
								<g:textField name="description"
									value="${productInstance?.description}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="name"><g:message
										code="product.name.label" default="Name" /></label></td>
							<td valign="top"
								class="value ${hasErrors(bean: productInstance, field: 'name', 'errors')}">
								<g:textField name="name" value="${productInstance?.name}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="price"><g:message
										code="product.price.label" default="Price" /></label></td>
							<td valign="top"
								class="value ${hasErrors(bean: productInstance, field: 'price', 'errors')}">
								<g:textField name="price"
									value="${fieldValue(bean: productInstance, field: 'price')}" />
							</td>
						</tr>
						<tr>
							<td><a href="#" id="openAddDrawingDialog">Add drawing</a></td>
							<td></td>
						</tr>
						<tr>
							<td><div id="drawings"></div></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>


			<div class="buttons">
				<span class="button"><g:submitButton name="create"
						class="save"
						value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
			</div>
		</g:form>

	</div>
</body>
</html>
