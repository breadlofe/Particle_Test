extends Area2D

@export var speed: int = 200
@onready var _animation_player = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
var dir: int
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_animation_player.play("fire")
	translate(Vector2(speed*delta*dir,0))

func _set_dir(facing):
	dir = facing


func _on_body_entered(body):
	if body.is_in_group("enemy"):
		body.got_hit(1)
		self.queue_free()
