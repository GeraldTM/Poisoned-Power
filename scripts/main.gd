extends Node2D

var scene


func start():
	await Fade.fade_out().finished
	get_tree().change_scene_to_file("res://assets/scenes/story_page.tscn")
	await get_tree().process_frame
	scene = get_tree().get_current_scene()
	scene.create_dialogue("A local baker, fed up with the kingdom's tyrannical monarch, and his darn taxes, is on his way to join the rebellious local alchemists cult, but is stopped by two royal guards")
	Fade.fade_in()
	await scene.next
	await get_tree().process_frame
	scene.create_dialogue("Guard 1: Halt! \n Guard 2: You have been selected as a cook for the king’s kitchen... \n Guard 1: Be at the castle tomorrow to start your first shift. Do not be late. Do not disappoint. The king’s tastes are the highest in the land, and his council expects only the best.")
	await scene.next
	await get_tree().process_frame
	scene.create_dialogue("The baker, frustrated, stressed, and annoyed continues on his journey. \n He arrives at the cult, but only has a chance to bring up his appointment after initiation. To his surprise, the cult leaders seem... excited?")
	await scene.next
	await get_tree().process_frame
	scene.create_dialogue("The cult leaders explain to the baker that this is, in fact, a wonderful opportunity! They task him with poisoning the King and his council, and send him off with a book titled: A Noob's Guide to Poisoning.")
	
	await scene.next
	await Fade.fade_out().finished
	get_tree().change_scene_to_file("res://assets/scenes/game.tscn")
	Fade.fade_in()
	await get_tree().process_frame
	scene = get_tree().get_current_scene()
	


func bad_ending(message:String):
	await Fade.fade_out().finished
	get_tree().change_scene_to_file("res://assets/scenes/story_page.tscn")
	await get_tree().process_frame
	scene = get_tree().get_current_scene()
	scene.create_dialogue( "YOU FAILED \n \n" + message)
	Fade.fade_in()
	await scene.next
	await Fade.fade_out().finished
	get_tree().change_scene_to_file("res://assets/scenes/main_menu.tscn")
	Fade.fade_in()
	await get_tree().process_frame
	scene = get_tree().get_current_scene()

func sucsess_ending():
	await Fade.fade_out().finished
	get_tree().change_scene_to_file("res://assets/scenes/story_page.tscn")
	await get_tree().process_frame
	scene = get_tree().get_current_scene()
	scene.create_dialogue( "CONGRATULATIONS!!! \n \n You successfully killed all of the tyranical leadership of the kingdom, and instantly set yourself up as the ruler, with the alchemist cult to council you. With Ultimate power now in hand, you become the most tyranical government the world has seen till this point, but this time you have magic, so that makes it okay... Right?")
	
	await scene.next
	Fade.fade_out()
	get_tree().change_scene_to_file("res://assets/scenes/main_menu.tscn")
	Fade.fade_in()
	await get_tree().process_frame
	scene = get_tree().get_current_scene()
