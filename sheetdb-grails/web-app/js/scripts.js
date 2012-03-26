function saveDrawingCallback(data)
{
	$('#drawings').append(data.id);
	
	var drawingCountField = $('input[name="drawingsCount"]');
	var count = parseInt(drawingCountField.val());
	
	var drawingsIdsHolder = $('#drawingsToBeAssigned');
	$('<input type="hidden" name="drawings[' + count + ']" value="' + data.id + '"/>').appendTo(drawingsIdsHolder);
	
	drawingCountField.val(++count);
	
	$('#addDrawingDialog').dialog('close');
}