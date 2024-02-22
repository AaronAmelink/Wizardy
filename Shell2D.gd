extends Sprite2D
@export var shellTexturePath : String
var rotatingValue : float
var movingValue : float
var startRotateSpeed : float
var directionVector : Vector2
var heightToFall : int = 20
var hitWall : bool = false

var rng = RandomNumberGenerator.new()
func setTexture(path : String, newPosition : Vector2, direction : Vector2):
	texture = load(path)
	position = newPosition
	var randDirection = rng.randf_range(-100, 100)
	var startSpeed = rng.randf_range(2, 5)
	directionVector = Vector2(direction.y + randDirection, -direction.x + randDirection)
	movingValue = startSpeed

# Called when the node enters the scene tree for the first time.
func _ready():
	startRotateSpeed = rng.randf_range(-2, 1)
	rotatingValue = startRotateSpeed
	look_at(get_global_mouse_position())
	rotation_degrees += 90
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	movingValue = lerpf(movingValue, 0.0, 0.07)
	rotatingValue = lerpf(rotatingValue, 0.0, 0.1)
	rotate(rotatingValue)
	if (!hitWall):
		position += directionVector.normalized() * movingValue
	else:
		if (heightToFall > 0 and movingValue < 0.5):
			position.y += 150 * delta
			heightToFall -= 150 * delta


func _on_area_2d_body_entered(Tilemap):
	print(Tilemap)
	print("hitwll")
	hitWall = true
