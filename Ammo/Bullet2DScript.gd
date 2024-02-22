extends Node2D
@export var bulletResource : bullet

func _ready():
	look_at(get_global_mouse_position())
	rotation_degrees += 90
# Called when the node enters the scene tree for the first time.
func setBullet(bulletResourceNew : bullet, newPosition : Vector2):
	position = newPosition
	bulletResource = bulletResourceNew
	$Tip.texture = load(bulletResource.tip.pathToTexture)
	$Cartridge.texture = load(bulletResource.cartridge.pathToTexture)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_local_y(-500 * delta)
	

