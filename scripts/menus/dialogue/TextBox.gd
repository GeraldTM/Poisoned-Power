extends HBoxContainer

signal closed

func new_dialogue(texture:Texture2D, message:String):
	$Panel2/Label.text = message
	$Panel/TextureRect.set_texture(texture)
	show()

func _on_link_button_pressed():
	closed.emit()
	queue_free()
