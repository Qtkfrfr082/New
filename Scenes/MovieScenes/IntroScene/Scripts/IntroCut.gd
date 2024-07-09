extends VideoStreamPlayer


# Called when the node enters the scene tree for the first time.

	# Change "NextScene.tscn" to the path of your next scen
	





func _on_finished():
	get_tree().change_scene_to_file("res://Level1/level_1.tscn")
	pass # Replace with function body.
