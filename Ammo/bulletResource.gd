extends Resource
class_name bullet

@export var tip : tip
@export var shell : shell
@export var GP : GP
@export var cartridge : cartridge

func onHit(collision : CollisionShape2D):
	if (tip.has_method("onHit")):
		tip.onHit()

