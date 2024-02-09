extends CharacterBody2D

@onready var gore = preload("res://scenes/blood_splat_CPU.tscn")

func got_hit(type):
	var temp_var
	if type == 0:
		$laugh.show()
	else:
		temp_var = gore.instantiate()
		spawn_particle(temp_var)
		self.queue_free()

func spawn_particle(temp_var):
	temp_var.global_position = self.global_position
	get_node("/root/Game/Level1").add_child(temp_var)
	temp_var.emitting = true
