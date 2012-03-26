<g:form>
	<div class="dialog">
		<table>
			<tbody>
				<tr class="prop">
					<td valign="top" class="name"><label for="code"><g:message
								code="drawing.code.label" default="Code" /></label></td>
					<td valign="top"
						class="value ${hasErrors(bean: drawingInstance, field: 'code', 'errors')}">
						<g:textField name="code" value="${drawingInstance?.code}" />
					</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name"><label for="created"><g:message
								code="drawing.created.label" default="Created" /></label></td>
					<td valign="top"
						class="value ${hasErrors(bean: drawingInstance, field: 'created', 'errors')}">
						<g:datePicker name="created" precision="day"
							value="${drawingInstance?.created}" />
					</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name"><label for="description"><g:message
								code="drawing.description.label" default="Description" /></label></td>
					<td valign="top"
						class="value ${hasErrors(bean: drawingInstance, field: 'description', 'errors')}">
						<g:textField name="description"
							value="${drawingInstance?.description}" />
					</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name"><label for="fileName"><g:message
								code="drawing.fileName.label" default="File Name" /></label></td>
					<td valign="top"
						class="value ${hasErrors(bean: drawingInstance, field: 'fileName', 'errors')}">
						<g:textField name="fileName" value="${drawingInstance?.fileName}" />
					</td>
				</tr>

			</tbody>
		</table>
	</div>
	<div class="buttons">
		<span class="button"> <g:submitToRemote method="POST" onSuccess="saveDrawingCallback(data)"
				 url="[controller:'drawing', base:'/api/']"  update="[success: 'message', failure: 'error']"
				value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
	</div>
</g:form>