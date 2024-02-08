extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# PARTICLE OBSERVER
func _on_emit_particles(particle, position, rotation, exploding=true):
	var spawned_particle = particle.instantiate()
	add_child(spawned_particle)
	spawned_particle.rotation = rotation
	spawned_particle.position = position
	if exploding:
		spawned_particle.emitting = true
