extends Area2D

var can_sleep:bool = false
var fader = Fade.new()
var faded:bool
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_sleep:
		$Hover.show()
	else:
		$Hover.hide()
	if can_sleep && Input.is_action_just_pressed("intreract"):
		faded = true
		%Time.stop()
		await Fade.fade_out().finished
		%Time.start()
		%Time.wait_time = %Time.day_time
		%Time.day += 1
		Fade.fade_in()



func _on_body_entered(body):
	if body == %Player: 
		can_sleep = true


func _on_body_exited(body):
	if body == %Player: 
		can_sleep = false
