extends Panel

func create_dialoge(message:String):
	$Panel/Label.text = message
	Fade.fade_in()
