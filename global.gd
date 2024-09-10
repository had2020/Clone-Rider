extends Node

var lives = 3
var game_speed = Vector2(-20,0)
var speed_change = Vector2(-0.01,0)

# save after reset
var high_score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	game_speed = game_speed + speed_change
