extends RigidBody2D

const jump_force = Vector2(0,-100)

func _ready():
	pass

func _process(delta):
	pass

func _input(event):
	if Input.is_action_pressed("Space"):
		apply_impulse(jump_force)
