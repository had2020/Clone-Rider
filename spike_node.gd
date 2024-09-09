extends Node2D

func _on_timer_timeout():
	self.position = self.position + Global.game_speed
