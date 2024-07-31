extends Area2D

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
		$Sprite2D2.show()
		

func _on_body_entered(body):
	if body == %Player && %Player.meal != null && contents == null:
		is_player_entered = true
		$Hover.show()

func _on_body_exited(body):
	if body == %Player:
		is_player_entered = false
		$Hover.hide()


func _on_path_follow_2d_meal_taken():
	$Sprite2D2.hide()
