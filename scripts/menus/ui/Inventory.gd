class_name Crafting_Menu

var contents:Array[Item] = []

func add_item(item:Item):
	if !contents.has(item):
		contents.append(item)

func remove_item(item:Item):
	contents.erase(item)

func get_items() -> Array[Item]:
	return contents
