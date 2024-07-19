extends Area2D

var contents:Meal = Meal.new().add_ingredient(preload("res://assets/data/items/liquid.tres"))

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	print("entered")
	if body == %Player:
		print("player entered")

