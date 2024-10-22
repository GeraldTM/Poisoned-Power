extends PointLight2D

@export_range(0,1) var flicker_variation: float
@export_range(0,5) var flicker_base: float
@export_range(0,1) var flicker_speed:float
var time_multiplier:float = 1

var target_energy:float
# Called when the node enters the scene tree for the first time.
func _ready():
	energy = flicker_base
	target_energy = flicker_base


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	flicker()
	if %Time.time_ratio > 0.75:
		time_multiplier = %Time.time_ratio
	else:
		time_multiplier = 0

func flicker():
	if energy - target_energy < 0.1 || energy - target_energy > -0.1 :
		target_energy = randf_range(flicker_base - (0.5 * flicker_variation), flicker_base + (0.5 * flicker_variation))
	energy = lerp(energy, target_energy, flicker_speed)* time_multiplier
