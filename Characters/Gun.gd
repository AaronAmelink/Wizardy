extends Node2D

var bulletScene = preload("res://bullet_2d.tscn")
var shellScene = preload("res://shell_2d.tscn")
@export var mag: Array[bullet]
var character : CharacterBody2D
var crosshair : Node2D
@export var newCartridge : cartridge
# Called when the node enters the scene tree for the first time.
func _ready():
	character = $"../CharacterBody2D"
	crosshair = $"../Crosshair"
	var newBullet : bullet = bullet.new()

	
	newBullet.cartridge = ResourceLoader.load("res://Ammo/Cartridge/BrassCartridge.tres")
	newBullet.shell = ResourceLoader.load("res://Ammo/Shell/BrassShell.tres")
	newBullet.tip = ResourceLoader.load("res://Ammo/Caps/BrassTip.tres")
	newBullet.GP = ResourceLoader.load("res://Ammo/GP/BlackGP.tres")
	for i in range(0, 20):
		mag.append(newBullet)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("left_click")):
		if (len(mag) != 0):
			var expendedBullet = mag.pop_front()
			var newBullet = bulletScene.instantiate()
			var newShell = shellScene.instantiate()
			newBullet.setBullet(expendedBullet, character.position)
			var vector : Vector2 = Vector2(character.position.x - get_global_mouse_position().x, character.position.y - get_global_mouse_position().y)
			newShell.setTexture(expendedBullet.shell.pathToTexture, character.position, vector)
			add_child(newShell)
			add_child(newBullet)
			

