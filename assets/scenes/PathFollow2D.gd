extends PathFollow2D

@export var multiplier:float
var point = 0
var to_next_point:bool
signal finished

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if to_next_point:
		if point == 0:
			if (progress_ratio + (multiplier*delta)) >= 1:
				progress_ratio = 1
				finished.emit()
				to_next_point = false
				point = 1
				$MasterChef/AnimatedSprite2D.play("standing")
			else:
				progress_ratio += multiplier*delta

		elif  point == 1:
			if (progress_ratio - (multiplier*delta)) <= 0:
				progress_ratio = 0
				finished.emit()
				to_next_point = false
				point = 0
				$MasterChef/AnimatedSprite2D.play("standing")
			else:
				progress_ratio -= multiplier*delta


func path_to_next() -> Node:
	if point == 0:
		to_next_point = true
		$MasterChef/AnimatedSprite2D.flip_h = false
		$MasterChef/AnimatedSprite2D.play("walking")
	elif point == 1: 
		to_next_point = true
		progress_ratio -= multiplier
		$MasterChef/AnimatedSprite2D.flip_h = true
		$MasterChef/AnimatedSprite2D.play("walking")
	return get_node(".")
