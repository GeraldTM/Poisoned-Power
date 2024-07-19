class_name Item
extends Resource

enum Flavour {savoury=0, sweet=1, sour=2, spicy=3, other=4}

@export var name:String
@export() var flavour_type:Flavour
@export var flavour_value:int

func get_item_name() -> String:
	return name

func get_flavour() -> Flavour:
	return flavour_type

func get_flavour_value() -> int:
	return flavour_value
