extends VideoStreamPlayer


# Called when the node enters the scene tree for the first time.

func _on_finished():
	get_tree().change_scene_to_file("res://Scenes/MenuScreen/Menutscn.tscn")
	pass # Replace with function body.
