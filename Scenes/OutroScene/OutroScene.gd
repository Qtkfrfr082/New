extends VideoStreamPlayer


# Called when the node enters the scene tree for the first time.

	# Change "NextScene.tscn" to the path of your next scen
	





func _on_finished():
	LoadScene.load_screen_to_scene("res://Scenes/Menutscn.tscn", {"test": "f"})
	pass # Replace with function body.
