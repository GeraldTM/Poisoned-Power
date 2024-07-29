extends "res://assets/scenes/FoodTaster.gd"

var is_player_entered:bool
var contents:Meal
signal meal_taken()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_player_entered && Input.is_action_just_pressed("intreract"):
		contents = %Player.meal
		%Player.meal = null
		$Hover.hide()
		meal_taken.emit()
		test_food(contents)
		satisfaction += 100
		var message = "MMmMMMMMmMMMMMMmMMMmM "
		if dead:
			message += contents.get_used_recipe().effect + "!"
		var dialogue = preload("res://assets/scenes/dialogue.tscn").instantiate()
		$"../UI".add_child(dialogue)
		print(dialogue.get_path_to(get_parent()))
		dialogue.new_dialogue(load("res://assets/textures/environment/the_birb.png"), message)

func _on_body_entered(body):
	if body == %Player && %Player.meal != null:
		is_player_entered = true
		$Hover.show()

func _on_body_exited(body):
	if body == %Player:
		is_player_entered = false
		$Hover.hide()
