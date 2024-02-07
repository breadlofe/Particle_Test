extends Sprite2D

var dir = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$torch_light.energy += delta * dir
	$torch_light.texture_scale += delta * dir
	if $torch_light.energy >= 5.5 or $torch_light.energy <= 5.0:
		dir *= -1
