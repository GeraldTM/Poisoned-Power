extends Area2D

var contents:Meal = Meal.new().add_ingredient(preload("res://assets/data/items/heat.tres"))

func _ready():
	$Sprite2D.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	%PointLight2D.flicker()
	
func _on_body_entered(body):
	print("entered")
	if body == %Player:
		print("player entered")

