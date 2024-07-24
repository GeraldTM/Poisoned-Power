class_name Player
extends CharacterBody2D

@export_range(0,255) var speed:int

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
	elif velocity.x < 0:
		$Sprite2D.flip_h = true
		$Sprite2D.play("walking")
	else:
		$Sprite2D.play("standing")
