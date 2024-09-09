extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# gravty.
	if not is_on_floor():
		velocity.y += gravity * delta

	# jump.
	if Input.is_action_pressed("Space"):
		velocity.y = JUMP_VELOCITY

	move_and_slide()
