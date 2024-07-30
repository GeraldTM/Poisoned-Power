extends CanvasLayer

signal start



func _on_start_game_pressed():
	start.emit()
