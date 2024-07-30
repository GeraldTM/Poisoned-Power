extends Timer

var time_ratio:float = 1
var day = 0
@export_range(0,120) var day_time:float
# Called when the node enters the scene tree for the first time.
func _ready():
	wait_time = day_time


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	time_ratio = absf(time_left-wait_time)/wait_time


func _on_timeout():
	Main.bad_ending("You forgot your bedtime!!!\n The guards found you with an only slightly suspicious book titled: A Noob's Guide to Poisoning. They Took you to the King, who, in a fit of rage, executed you imediately... \n Guess you shoulda listened to your mom about bedtimes... Whoops!")

func get_time() -> float:
	return wait_time - time_left
