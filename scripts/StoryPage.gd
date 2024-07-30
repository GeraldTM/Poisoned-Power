extends CanvasLayer

signal next

func create_dialogue(message:String):
	$Panel/Panel/Label.text = message


func _on_link_button_pressed():
	next.emit()
