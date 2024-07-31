extends PathFollow2D

@export var multiplier:float
var point = 0
var to_next_point:bool
signal finished
var council_members:Array[FoodTaster] = [FoodTaster.create("King Kelan the Terrible"),FoodTaster.create("Gwallter Jaxx The Strong"),FoodTaster.create("Rolph the Destroyer"),FoodTaster.create("Harold Gareth the Powerfull"), FoodTaster.create("Irvin Flanagan the Rich"), FoodTaster.create("Wenceslaus the Undefeated"), FoodTaster.create("Connor Finn the Unkempt")]
var meal:Meal
signal meal_taken
signal poison_used(recipe:Recipe)
var current_victim:FoodTaster

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if to_next_point:
		if point == 0:
			if (progress_ratio + (multiplier*delta)) >= 1:
				progress_ratio = 1
				finished.emit()
				to_next_point = false
				point = 1
				$MasterChef/AnimatedSprite2D.play("standing")
			else:
				progress_ratio += multiplier*delta

		elif  point == 1:
			if (progress_ratio - (multiplier*delta)) <= 0:
				progress_ratio = 0
				finished.emit()
				to_next_point = false
				point = 0
				$MasterChef/AnimatedSprite2D.play("standing")
			else:
				progress_ratio -= multiplier*delta


func path_to_next() -> Node:
	if point == 0:
		to_next_point = true
		$MasterChef/AnimatedSprite2D.flip_h = false
		$MasterChef/AnimatedSprite2D.play("walking")
	elif point == 1: 
		to_next_point = true
		progress_ratio -= multiplier
		$MasterChef/AnimatedSprite2D.flip_h = true
		$MasterChef/AnimatedSprite2D.play("walking")
	return self

func select_victim() -> Node:
	current_victim = council_members.pick_random()
	var dialogue = preload("res://assets/scenes/dialogue.tscn").instantiate()
	%UI.add_child(dialogue)
	dialogue.new_dialogue_from_string("Also, just letting you know that " + current_victim.taster_name + " will be eating of what you prepare today")
	await dialogue.closed
	finished.emit()
	return self

func morning_chat():
	print("morning routine")
	await path_to_next().finished
	var dialogue = preload("res://assets/scenes/dialogue.tscn").instantiate()
	if current_victim.dead:
		%UI.add_child(dialogue)
		dialogue.new_dialogue_from_string("Good morning... Did you hear that " + current_victim.taster_name + " was killed last night?")
		await dialogue.closed
		dialogue = preload("res://assets/scenes/dialogue.tscn").instantiate()
		%UI.add_child(dialogue)
		dialogue.new_dialogue_from_string("Yea... I heard he died of " + meal.get_used_recipe().effect)
		await dialogue.closed
	else:
		dialogue = preload("res://assets/scenes/dialogue.tscn").instantiate()
		%UI.add_child(dialogue)
		dialogue.new_dialogue_from_string("Good Morning... I hope you slept well...")
		await dialogue.closed
		dialogue = preload("res://assets/scenes/dialogue.tscn").instantiate()
		%UI.add_child(dialogue)
		dialogue.new_dialogue_from_string("Not really...")
		await dialogue.closed
	await select_victim()
	path_to_next()

func collect_food():
	await path_to_next().finished
	var dialogue = preload("res://assets/scenes/dialogue.tscn").instantiate()
	%UI.add_child(dialogue)
	dialogue.new_dialogue_from_string("Hello... Im here to colect your meal. I hope for your sake it is passable")
	await dialogue.closed
	if $"../../Pedastal".contents != null:
		meal = $"../../Pedastal".contents
		$"../../Pedastal".contents = null
		meal_taken.emit()
		current_victim.test_food(meal)
		if current_victim.dead == true: 
			council_members.erase(current_victim)
			poison_used.emit(meal.get_used_recipe())
			if council_members.size() == 0:
				Main.sucsess_ending()
	else:
		dialogue = preload("res://assets/scenes/dialogue.tscn").instantiate()
		%UI.add_child(dialogue)
		dialogue.new_dialogue_from_string("WHAT!?! HAVE YOU NOT CREATED A MEAL?!? GUARDS!!!")
		await dialogue.closed
		Main.bad_ending("oops... you forgor to make a meal, and well... Im sure you can guess what happens next...")
	path_to_next()
	


func _on_time_munchies_time():
	collect_food()
