extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN) # Replace with function body.
	
var time : float

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	rotation += 3*delta
	scale = Vector2(1 + get_sin(time), 1 + get_sin(time))
	position = get_global_mouse_position()

func get_sin(time):
	return (sin(time * 1)) * 0.2
