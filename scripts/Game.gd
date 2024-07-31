extends Node2D

func _ready():
	await %PathFollow2D.path_to_next().finished
	var dialogue = preload("res://assets/scenes/dialogue.tscn").instantiate()
	%UI.add_child(dialogue)
	dialogue.new_dialogue_from_string("Hello...")
	await dialogue.closed
	await get_tree().process_frame;await get_tree().process_frame
	dialogue = preload("res://assets/scenes/dialogue.tscn").instantiate()
	%UI.add_child(dialogue)
	dialogue.new_dialogue_from_string("So you're the new person eh?")
	await dialogue.closed
	await get_tree().process_frame;await get_tree().process_frame
	dialogue = preload("res://assets/scenes/dialogue.tscn").instantiate()
	%UI.add_child(dialogue)
	dialogue.new_dialogue_from_string("Welcome to the kitchen... just have some food ready for when the candles come on and you'll be fine")
	await dialogue.closed
	await get_tree().process_frame;await get_tree().process_frame
	dialogue = preload("res://assets/scenes/dialogue.tscn").instantiate()
	%UI.add_child(dialogue)
	dialogue.new_dialogue_from_string("Ill come right here to pick it up around then, so be sure to put a decent meal on the counter here")
	await dialogue.closed
	await get_tree().process_frame;await get_tree().process_frame
	dialogue = preload("res://assets/scenes/dialogue.tscn").instantiate()
	%UI.add_child(dialogue)
	await %PathFollow2D.select_victim()
	dialogue.new_dialogue_from_string("That is... as long as your food is good... and of course, always check your recipies for poison by feeding it to the...")
	await dialogue.closed
	await get_tree().process_frame;await get_tree().process_frame
	dialogue = preload("res://assets/scenes/dialogue.tscn").instantiate()
	%UI.add_child(dialogue)
	dialogue.new_dialogue_from_string("....... Th.. The Birb..........")
	await dialogue.closed
	await get_tree().process_frame;await get_tree().process_frame
	dialogue = preload("res://assets/scenes/dialogue.tscn").instantiate()
	%UI.add_child(dialogue)
	dialogue.new_dialogue(load("res://assets/textures/environment/the_birb.png"), "MMmMMMMMmMMMMMMmMMMmM")
	await dialogue.closed
	await get_tree().process_frame;await get_tree().process_frame
	dialogue = preload("res://assets/scenes/dialogue.tscn").instantiate()
	%UI.add_child(dialogue)
	dialogue.new_dialogue_from_string("Bye...")
	await dialogue.closed
	await get_tree().process_frame;await get_tree().process_frame
	await %PathFollow2D.path_to_next().finished
	dialogue = preload("res://assets/scenes/dialogue.tscn").instantiate()
	%UI.add_child(dialogue)
	dialogue.new_dialogue_from_string("BY THE WAY...")
	await dialogue.closed
	await get_tree().process_frame;await get_tree().process_frame
	dialogue = preload("res://assets/scenes/dialogue.tscn").instantiate()
	%UI.add_child(dialogue)
	dialogue.new_dialogue_from_string("SOME THINGS CAN BE INTERACTED WITH BY CLICKING ON THEM...")
	await dialogue.closed
	await get_tree().process_frame;await get_tree().process_frame
	dialogue = preload("res://assets/scenes/dialogue.tscn").instantiate()
	%UI.add_child(dialogue)
	dialogue.new_dialogue_from_string("OTHERS BY PRESSING [E] WHEN YOUR CHARACTER IS ON TOP OF THEM")
	await dialogue.closed
	await get_tree().process_frame;await get_tree().process_frame
	dialogue = preload("res://assets/scenes/dialogue.tscn").instantiate()
	%UI.add_child(dialogue)
	dialogue.new_dialogue_from_string("THINGS WILL HAVE A BLUR EFFECT BEHIND THEM WHEN THEY CAN BE INTERACTED WITH")
	await dialogue.closed
	await get_tree().process_frame;await get_tree().process_frame
