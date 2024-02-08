extends Node

@onready var big_shot_explosion = load("res://scenes/bullet_explosion.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func emit(attach_to : Node2D, particle_name : String = "None", 
			position : Vector2 = Vector2(0,0), rotation : float = 0):
	var particle_to_spawn = null
	match particle_name:
		"None":
			print("please supply a particle name")
			return
		"big_shot_explosion":
			particle_to_spawn  = big_shot_explosion
			
	if particle_to_spawn == null:
		print("There is no particle called: " + particle_name)
		return

	var new_particle= particle_to_spawn.instantiate()
	attach_to.add_child(new_particle)
	new_particle.rotation = rotation
	new_particle.position = position
	if not new_particle.emitting:
		print("BOOM")
		new_particle.emitting = true
