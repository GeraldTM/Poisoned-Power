class_name Meal

var flavour: Array[Item.Flavour] = []
var flavour_level:int
var ingredients:Array[Item]=[]
var meal_type:String
var recipes:Array[Recipe] = []

func add_ingredient(item:Item):
	if !ingredients.has(item):
		ingredients.append(item)
		if item.get_flavour() == Item.Flavour.other:
			flavour_level += item.get_flavour_value()
			pass
		if flavour.size() < 2:
			flavour.append(item.get_flavour())
			
		if flavour.has(item.get_flavour()):
			flavour_level += item.get_flavour_value()
		else:
			@warning_ignore("integer_division")
			flavour_level -= 1/2*(item.get_flavour_value())
		
func get_flavour_level() -> int:
	return flavour_level

func get_ingredients() -> Array[Item]:
	return ingredients

func contains_recipe() -> bool:
	recipes = Recipe.get_recipes()
	for recipe in recipes:
		var valid_items = 0
		for item in recipe.get_ingredients():
			if ingredients.has(item):
				valid_items += 1
		if valid_items == recipe.get_ingredients().size():
			return true
	return false
