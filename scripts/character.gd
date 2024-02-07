extends CharacterBody2D


@export  var SPEED = 300.0
@export  var JUMP_VELOCITY = -400.0
@export  var BULLET: PackedScene
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var _animation_player = $AnimationPlayer
@onready var _sprite_2D = $Sprite2D

func _process(_delta):
	if Input.is_action_pressed("move_right"):
		_animation_player.play("walk")
		_sprite_2D.flip_h = false
	elif Input.is_action_pressed("move_left"):
		_animation_player.play("walk")
		_sprite_2D.flip_h = true
	else:
		_animation_player.stop()
	if Input.is_action_pressed("shoot"):
		$shot_charge.show()
	if Input.is_action_just_released("shoot"):
		spawn_bullet(self.position, self.rotation, $bullet_holder.global_position)
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
	
func spawn_bullet(pos, rot, test):
	print("WAH", pos)
	print("TEST", test)
	var bullet = BULLET.instantiate()
	bullet.position = test
	bullet.rotation = self.rotation
	get_tree().get_root().add_child(bullet)
