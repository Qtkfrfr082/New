extends Control

var parameters: Dictionary
func _on_texture_button_pressed():
	LoadScene.load_screen_to_scene("res://Scenes/MenuScreen/Menutscn.tscn", {"test": "f"})
	pass 
