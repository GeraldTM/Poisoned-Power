class_name Recipe
extends Resource

@export var ingredients:Array[Item] = []

static func get_recipes() -> Array[Recipe]:
	var recipies:Array[Recipe] = []
	var files = ResourceLoad.get_all_file_paths("res://assets/data/recipes/")
	for file in files:
		recipies.append(load(file))
	return recipies

func get_ingredients()->Array[Item]:
	return ingredients
