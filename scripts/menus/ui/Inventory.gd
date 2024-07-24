class_name Crafting_Menu

extends ItemList

var contents:Array[Item] = []
var world_item = preload("res://assets/scenes/world_item.tscn")
var mouse_placement_valid:bool = false
var dragging:bool = false
var current_instance:RigidBody2D
var current_instance_index:int

func _ready():
	add_inv_item(preload("res://assets/data/items/red_mushroom.tres"))
	add_inv_item(preload("res://assets/data/items/grapes.tres"))
	add_inv_item(preload("res://assets/data/items/cherries.tres"))


func _process(delta):
	if mouse_placement_valid && Input.is_action_just_released("mouse_click") && dragging:
		dragging = false
		print("debug ")
		current_instance.follow_mouse = false
		remove_inv_item(contents[current_instance_index])
		current_instance.item_clicked.connect(_on_item_clicked)
		for i in contents.size():
			set_item_disabled(i,false)

func add_inv_item(item:Item):
	if contents.size() >= 5:
		while contents.size() > 4:
			remove_inv_item(contents.front())
	if !contents.has(item):
		contents.append(item)
		add_icon_item(load(item.texture_path))

func remove_inv_item(item:Item):
	
	var index = contents.find(item)
	deselect(index)
	remove_item(index)
	contents.erase(item)

func get_items() -> Array[Item]:
	return contents


func _on_item_selected(index):
	dragging = true
	for i in contents.size():
		if i != index:
			set_item_disabled(i,true)
	var instance = world_item.instantiate()
	instance.set_item(contents[index])
	%Items.add_child(instance)
	current_instance = instance
	current_instance_index = index

func _on_item_clicked(item:Item):
	add_inv_item(item)

func _on_valid_item_placement_area_mouse_entered():
	mouse_placement_valid = true


func _on_valid_item_placement_area_mouse_exited():
	mouse_placement_valid = false
