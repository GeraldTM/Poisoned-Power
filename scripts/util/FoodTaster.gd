class_name FoodTaster

extends Area2D

var taster_name:String
var flavour_tollerances:Array[int] = [3,3,3,3,3]
var dead:bool = false
var satisfaction:float

static func create(title:String)-> FoodTaster:
	var instance = FoodTaster.new()
	instance.taster_name = title
	return instance

func _ready():
	for flavour in Item.Flavour:
		flavour_tollerances.append(0)

func test_food(meal:Meal):
	dead = false
	for flavour in meal.flavour:
		flavour_tollerances[flavour_tollerances.bsearch(flavour)] -=2
	print(flavour_tollerances)
	for i in flavour_tollerances.size():
		flavour_tollerances[i] += 1
		
	print(flavour_tollerances)
	
	for flavour in meal.flavour:
		satisfaction += meal.flavour_level * (flavour_tollerances[flavour]/2)
	print(satisfaction)
	if satisfaction <= 0:
		Main.bad_ending("Your food was so garbage that the king had you executed for poisoning despite not knowing about your attempted poisoning... \n how ironic")
	if meal.contains_recipe():
		dead = true

