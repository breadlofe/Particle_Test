extends CharacterBody2D


@export  var SPEED = 300.0
@export  var JUMP_VELOCITY = -400.0
@export  var BULLET: PackedScene
@export  var BIG_BULLET: PackedScene
@export  var SHOT_TIMER: float = 1.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var _animation_player = $AnimationPlayer
@onready var _sprite_2D = $Sprite2D
var dir: int = 1

func _process(_delta):
	if Input.is_action_pressed("move_right"):
		_animation_player.play("walk")
		_sprite_2D.flip_h = false
		dir = 1
	elif Input.is_action_pressed("move_left"):
		_animation_player.play("walk")
		_sprite_2D.flip_h = true
		dir = -1
	else:
		_animation_player.stop()
	if Input.is_action_pressed("shoot"):
		SHOT_TIMER -= _delta
		$shot_charge.modulate.a = 1.0 - SHOT_TIMER
		$shot_charge.show()
	if Input.is_action_just_released("shoot"):
		if SHOT_TIMER > 0:
			spawn_bullet($bullet_holder.global_position, self.rotation, 0)
		else:
			spawn_bullet($bullet_holder.global_position, self.rotation, 1)
		SHOT_TIMER = 1.0
		$shot_charge.hide()

func _physics_process(delta):
	# Add the gravity.
	#print(self.global_position)
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration...
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func spawn_bullet(pos, rot, type):
	var bullet 
	if type == 0:
		bullet = BULLET.instantiate()
	else:
		bullet = BIG_BULLET.instantiate()
	bullet._set_dir(dir)
	bullet.position = pos
	bullet.rotation = self.rotation
	get_tree().get_root().add_child(bullet)
