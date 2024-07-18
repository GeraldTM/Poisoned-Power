class_name Item
extends Resource

@export var name:String
@export var scene:PackedScene
@export var flavour_type:String
@export var flavour_value:int


func get_item_name() -> String:
	return name
