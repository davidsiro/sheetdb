function saveDrawingCallback(data)
{
	alert(data);
	
	$('#drawings').text(data.code);
	$('#addDrawingDialog').dialog('close');
	
}