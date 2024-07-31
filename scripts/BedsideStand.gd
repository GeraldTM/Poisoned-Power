extends Area2D

var is_player_entered:bool
var items:Array[Item]
# Called when the node enters the scene tree for the first time.
func _ready():
	for item_node in %Items.get_children():
		items.append(item_node.item)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_player_entered && Input.is_action_just_pressed("intreract"):
		var book = preload("res://assets/scenes/recipe_book.tscn").instantiate()
		%UI.add_child(book)
		book.load_recipes(items)

func _on_body_entered(body):
	if body == %Player:
		is_player_entered = true
		$Hover.show()

func _on_body_exited(body):
	if body == %Player:
		is_player_entered = false
		$Hover.hide()
