extends CharacterBody2D
func _ready():
	pass
	
@onready var Player = $".."
@onready var animator = $AnimatedSprite2D
@export var SPEED: int

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.



	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionX = Input.get_axis("ui_left", "ui_right")
	var directionY = Input.get_axis("ui_up", "ui_down")
	
	
	if directionY:
		velocity.y = directionY * SPEED * delta
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	if directionX:
		velocity.x = directionX * SPEED * delta
		animator.play("Running")
		animator.flip_h = (false if directionX == 1 else true)
	else:
		animator.play("Idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	

# Get the gravity from the project settings to be synced with RigidBody nodes.
