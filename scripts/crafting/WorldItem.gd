class_name WorldItem

extends RigidBody2D

@export var item:Item = null
var follow_speed:float = 4

signal item_clicked(item:Item)

var zeroVector = Vector2()

var is_mouse_entered:bool = false
var follow_mouse:bool = false

func _ready():
	freeze_mode = RigidBody2D.FREEZE_MODE_KINEMATIC
	if item != null:
		set_item(item)

func set_item(new_item:Item):
	item = new_item
	$Sprite2D.set_texture(load(item.texture_path))
	$Shadow.set_texture(load(item.texture_path))
	show()

func _process(_delta):
	if is_mouse_entered  && !follow_mouse:
		$Shadow.show()
	else:
		$Shadow.hide()
	if Input.is_action_just_pressed("mouse_click"):
		if !follow_mouse&& is_mouse_entered:
			item_clicked.emit(item)
			queue_free()

func _physics_process(delta):
	if follow_mouse:
		set_collision_layer_value(5, false)
		set_collision_mask_value(2, false)
		set_collision_mask_value(5, false)
		freeze = true
		global_position = global_position.lerp(get_global_mouse_position(), delta * follow_speed)
	else:
		freeze = false
		set_collision_layer_value(5, true)
		set_collision_mask_value(2, true)
		set_collision_mask_value(5, true)

func _on_mouse_entered():
	is_mouse_entered = true


func _on_mouse_exited():
	is_mouse_entered = false

