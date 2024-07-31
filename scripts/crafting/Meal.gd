class_name Meal

var flavour: Array[Item.Flavour] = []
var flavour_level:float = 0
var ingredients:Array[Item]=[]
var meal_type:String
var recipes:Array[Recipe] = []
var used_recipe:Recipe

func add_ingredient(item:Item):
	if !ingredients.has(item):
		ingredients.append(item)
		if item.flavour_type == Item.Flavour.other:
			flavour_level += item.flavour_value
			return
		
		if flavour.size() < 2 && !flavour.has(item.flavour_type):
			flavour.append(item.flavour_type)
		
		if flavour.has(item.flavour_type):
			flavour_level += item.flavour_value
		else:
			flavour_level += -1.0/2.0*(item.flavour_value)

func get_flavour_level() -> float:
	return flavour_level

func get_ingredients() -> Array[Item]:
	return ingredients

func get_used_recipe() -> Recipe:
	print(used_recipe.effect)
	return used_recipe

func contains_recipe() -> bool:
	recipes = Recipe.get_recipes()
	for recipe in recipes:
		var valid_items = 0
		print(recipe.effect)
		for item in recipe.get_ingredients():
			if ingredients.has(item):
				valid_items += 1
		if valid_items == recipe.get_ingredients().size():
			used_recipe = recipe
			return true
	return false
