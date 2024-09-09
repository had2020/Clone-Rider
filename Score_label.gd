extends Label

var score = 0

func _ready():
	self.text = str(0) + "m"

func _on_score_timer_timeout():
	score = score + 1
	self.text = str(score) + "m"
