extends Node2D

const start_pos = Vector2(570,340)

func _ready():
	self.position = start_pos
	if Global.lives == 2:
		$HeartFull1.visible = false
	elif Global.lives == 1:
		$HeartFull2.visible = false
		$HeartFull1.visible = false
	elif Global.lives == 0:
		$HeartFull3.visible = false
		$HeartFull2.visible = false
		$HeartFull1.visible = false

func _on_vanish_timer_timeout():
	self.queue_free()
