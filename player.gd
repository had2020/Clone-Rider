extends RigidBody2D

const jump_force = Vector2(0,-100)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if Input.is_action_pressed("Space"):
		apply_impulse(jump_force)
