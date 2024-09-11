extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -500.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var current_wheel = 0
var fire_slash_state = false

func _ready():
	Global.lives = 3
	Global.game_speed = Vector2(-20,0)
	Global.speed_change = Vector2(-0.01,0)

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
		health_loss()
	if area.is_in_group("floor"):
		$fire_slash.visible = true
		fire_slash_state = true
		$firetail.visible = true

func health_loss():
	var heart_gui = preload("res://heart_gui.tscn").instantiate()
	Global.lives = Global.lives - 1
	add_sibling(heart_gui)
	if Global.lives == 0:
		$"../Score_label".finish()
		get_tree().reload_current_scene() #Reloads game from start

func _on_wheel_change_timeout():
	fire_slash_state = false
	$fire_slash.visible = false
	$wheel1.rotate(1)

func disable_wheels():
	$wheel1.visible = false
	$wheel2.visible = false
	$wheel3.visible = false
	$wheel4.visible = false

func old_wheel_ani():
	if current_wheel < 4:
		current_wheel = current_wheel + 1
	elif current_wheel == 4 or current_wheel < 4:
		current_wheel = 1
	if current_wheel == 1:
		disable_wheels()
		$wheel1.visible = true
	if current_wheel == 2:
		disable_wheels()
		$wheel2.visible = true
	if current_wheel == 3:
		disable_wheels()
		$wheel3.visible = true
	if current_wheel == 4:
		disable_wheels()
		$wheel4.visible = true

func _on_player_area_area_exited(area):
	$firetail.visible = false


func _on_animation_timer_timeout():
	$"../AnimationPlayer".play("moving")
