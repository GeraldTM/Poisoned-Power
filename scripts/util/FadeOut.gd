extends AnimationPlayer

func _on_animation_finished(anim_name):
	$"../..".queue_free()
