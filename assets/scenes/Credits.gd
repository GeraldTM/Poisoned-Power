extends LinkButton

var credits_toggled:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if credits_toggled:
		%Label.show()
	else:
		%Label.hide()

func _on_pressed():
	credits_toggled = !credits_toggled
