extends CanvasModulate

@export_range(0,1) var colour_max:float
@export_range(0,1) var colour_base
var time:float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	time = absf(absf((%Time.time_ratio*2)-1)-1)
	color = Color.from_hsv(0,0,time*(colour_max-colour_base)+colour_base)
