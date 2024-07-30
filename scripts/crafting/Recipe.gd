class_name Recipe
extends Resource

@export var ingredients:Array[Item] = []
@export var effect:String

static func get_recipes() -> Array[Recipe]:
	print("checking recipies")
	var recipies:Array[Recipe] = []
	var files = ResourceLoad.get_all_file_paths("res://assets/data/recipes/") 
	for file in files:
		recipies.append(load(file))
		print(recipies.back().effect)
	return recipies

func get_ingredients()->Array[Item]:
	return ingredients
