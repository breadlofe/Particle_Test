extends Area2D

@export var tp_player: Vector2 = Vector2(100,100)
@export var tp_camera: Vector2 = Vector2(100,100)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("player"):
		#body.global_position.x = tp_player.x
		#body.global_position.y = tp_player.y
		print(get_node("../Camera2D").global_position.x)
		print(get_node("../Camera2D").global_position.y)
		get_node("../Camera2D").global_position.x = tp_camera.x
		#get_node("../Camera2D").global_position.y = tp_camera.y
