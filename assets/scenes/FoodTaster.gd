extends Area2D

var flavour_tollerances:Array = [0,0,0,0,0]
var dead:bool = false
var satisfaction:float

func _ready():
	for flavour in Item.Flavour:
		flavour_tollerances.append(0)

func test_food(meal:Meal):
	dead = false
	for flavour in meal.flavour:
		flavour_tollerances[flavour] += 2
	
	for flavour in flavour_tollerances:
		flavour -= 1
	
	for flavour in meal.flavour:
		satisfaction += meal.flavour_level / (flavour_tollerances[flavour])/2
	if meal.contains_recipe():
		dead = true
