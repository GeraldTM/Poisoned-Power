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
		fader = Fade.fade_out($Timer.wait_time)
		fader.finished.connect(_on_fade_finished)
		%Time.start()
		%Time.wait_time = %Time.day_time



func _on_body_entered(body):
	if body == %Player && %Time.time_ratio >= 0.7: 
		can_sleep = true


func _on_body_exited(body):
	if body == %Player: 
		can_sleep = false

func  _on_fade_finished():
	if faded:
		fader.fade_in($Timer.wait_time)
