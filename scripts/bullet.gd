extends Area2D
@export var speed: int = 200
var dir: int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(Vector2(speed*delta*dir,0))
	#self.postion.x += delta

func _set_dir(facing):
	dir = facing
