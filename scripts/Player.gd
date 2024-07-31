class_name Player
extends CharacterBody2D

@export_range(0,255) var speed:int
var meal:Meal
var suspicion:float
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	get_input()
	move_and_slide()
	

func get_input():
	velocity.x =  Input.get_vector("left", "right", "up", "down").x * speed
	if velocity.x > 0:
		$Sprite2D.flip_h = false
		$Sprite2D.play("walking")
		$Sprite2D2.flip_h = true
	elif velocity.x < 0:
		$Sprite2D.flip_h = true
		$Sprite2D.play("walking")
		$Sprite2D2.flip_h = false
	else:
		$Sprite2D.play("standing")


func _on_kitchen_pot_send_meal(new_meal):
	meal = new_meal
	$Sprite2D2.show()


func _on_stove_send_meal(new_meal):
	meal = new_meal
	$Sprite2D2.show()


func _on_pedastal_meal_taken():
	$Sprite2D2.hide()


func _on_the_birb_meal_taken():
	$Sprite2D2.hide()


func _on_path_follow_2d_poison_used(recipe):
	recipe.suspicion += 1
	suspicion += recipe.suspicion
	print(suspicion)
	if suspicion >= 4:
		Main.bad_ending("You drew too much suspicion, and were caught by the royal guard... The alchemist's cult was disbanded and it's secrets stolen. Good job")
