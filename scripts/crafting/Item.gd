class_name Item
extends Resource

enum Flavour {savoury, sweet, sour, spicy, other}

@export var name:String
@export var flavour_type:Flavour
@export_range(0,5) var flavour_value:float
@export_file("*.png") var texture_path:String

func get_item_name() -> String:
	return name

func get_flavour() -> Flavour:
	return flavour_type

func get_flavour_value() -> float:
	return flavour_value
