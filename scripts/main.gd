extends Node2D

var main_menu_scene = preload("res://assets/scenes/main_menu.tscn").instantiate()
var game_scene

func _ready():
	add_child(main_menu_scene)
	main_menu_scene.start.connect(on_start)
	

func on_start():
	await Fade.fade_out().finished
	main_menu_scene.queue_free()
	
	get_tree().change_scene_to_file("res://assets/scenes/game.tscn")
	Fade.fade_in()
