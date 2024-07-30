extends ParallaxBackground

@export var layer_1_multiplier:float
@export var layer_2_multiplier:float

func _input(event):
	if event is InputEventMouseMotion:
		var mouse_x = event.position.x
		var mouse_y = event.position.y
		var relative_x = (mouse_x - (get_viewport().get_size().x/2)) / (get_viewport().get_size().x/2)
		var relative_y = (mouse_y - (get_viewport().get_size().y/2)) / (get_viewport().get_size().y/2)
		$ParallaxLayer.motion_offset.x = layer_1_multiplier * relative_x
		$ParallaxLayer.motion_offset.y = layer_1_multiplier * relative_y
		$ParallaxLayer2.motion_offset.x = layer_2_multiplier * relative_x
		$ParallaxLayer2.motion_offset.y = layer_2_multiplier * relative_y
