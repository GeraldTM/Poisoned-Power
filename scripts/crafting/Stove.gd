extends Area2D

var contents:Meal = Meal.new()
var is_player_entered:bool
var num_items:int = 0

signal send_meal(meal:Meal)

func _ready():
	reset()

func reset():
	contents = Meal.new()
	add_ingredient(preload("res://assets/data/items/heat.tres"))
	num_items = 0
	$Sprite2D.play("off")
	$Hover.play("off")
	%PointLight2D.hide()
	$Hover.hide()
	$Sprite2D2.set_texture(Texture2D.new())
	$Sprite2D3.set_texture(Texture2D.new())
	$Sprite2D4.set_texture(Texture2D.new())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	%PointLight2D.flicker()
	if is_player_entered && num_items != 0 && Input.is_action_just_pressed("intreract"):
		send_meal.emit(contents)
		reset()

func add_ingredient(item:Item):
	%PointLight2D.show()
	$Sprite2D.play("flaming")
	$Hover.play("flaming")
	if item.flavour_type != Item.Flavour.other && !contents.get_ingredients().has(item):
		num_items += 1 
		if num_items == 1:
			$Sprite2D2.set_texture(load(item.texture_path))
		if num_items == 2:
			$Sprite2D3.set_texture(load(item.texture_path))
		if num_items == 3:
			$Sprite2D4.set_texture(load(item.texture_path))
		
	contents.add_ingredient(item)

func _on_mouse_entered():
	if %ItemList.dragging:
		$Hover.show()


func _on_mouse_exited():
	$Hover.hide()


func _on_body_exited(body):
	is_player_entered = false
	$Hover.hide()

func _on_body_entered(body):
	is_player_entered = true
	if num_items != 0:
		$Hover.show()

