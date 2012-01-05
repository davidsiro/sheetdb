function saveDrawingCallback(data)
{
	$('#drawings').append(data);
	$('#addDrawingDialog').dialog('close');
}