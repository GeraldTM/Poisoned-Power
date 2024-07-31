extends Panel

var items:Array[Item]
var i:int = 1

func load_recipes(items:Array[Item]):
	self.items = items
	_on_front_pressed()

func _on_front_pressed():
	i = fmod(i+1,12) 
	var loaded = load(items[i].texture_path)
	print(loaded)
	%TextureRect.texture = loaded
	%Title.text = items[i].name
	%Description.text = items[i].description

func _on_back_pressed():
	i = fmod(i-1,12) 
	var loaded = load(items[i].texture_path)
	print(loaded)
	%TextureRect.texture = loaded
	%Title.text = items[i].name
	%Description.text = items[i].description

func _on_exit_pressed():
	queue_free()
