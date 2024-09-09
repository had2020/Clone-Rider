extends Node2D

func random_spawn():
	var child_count = get_child_count()
	var random_num = randi_range(0, child_count - 1)
	var chosen_child = get_child(random_num)
	var spike = preload("res://spike_node.tscn").instantiate()
	if chosen_child != null:
		if chosen_child != $Timer:
			chosen_child.add_child(spike)
			spike.position = chosen_child.position  

func _on_timer_timeout():
	random_spawn()

func get_spawns(): # only for dev use
	var spawnpoints = Array()
	for i in get_child_count():
		var child = get_child(i)
		spawnpoints.append(child)
	print(spawnpoints)
