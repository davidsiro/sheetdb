function saveDrawingCallback(data)
{
	$('#drawings').append(data.id);
	$('#addDrawingDialog').dialog('close');
}