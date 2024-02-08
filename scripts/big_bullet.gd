extends Area2D

@export var speed: int = 200
@onready var _animation_player = $AnimationPlayer
@onready var particle_emitter = get_node("/root/ParticleController")
#signal emit_particles(particle, position, rotation)
#var big_shot_explosion = preload("res://scenes/bullet_explosion.tscn")
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
		particle_emitter.emit(get_node("/root/Game/Level1"), "big_shot_explosion", self.global_position, self.rotation)
		#emit_particles.emit(big_shot_explosion, self.position, self.rotation, true)
		self.queue_free()
