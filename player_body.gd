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

func _on_player_area_area_entered(area):
	if area.is_in_group("Damage"):
		var heart_gui = preload("res://heart_gui.tscn").instantiate()
		Global.lives = Global.lives - 1
		add_sibling(heart_gui)
		if Global.lives == 0:
			get_tree().reload_current_scene() #Reloads game from start
