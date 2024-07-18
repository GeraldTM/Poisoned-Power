class_name Crafting_Menu

var _content:Array[Stack] = []

func add_item(item:Item):
	

func remove_item(item:Item):
	_content.erase()

func get_items() -> Array[Stack]:
	return _content
