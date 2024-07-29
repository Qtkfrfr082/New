extends Control
var parameters: Dictionary
#this is script for Title Screen 

func _ready():
	$Timer.start()
	pass
func _on_start_button_pressed():
	LoadScene.load_screen_to_scene("res://Scenes/MovieScenes/IntroScene/IntroCut.tscn", {"test": "f"})
	$AudioStreamPlayer.play()
	$AudioStreamPlayer2D.stop()
	pass # Replace with function body.

func _on_quit_button_pressed():
	$AudioStreamPlayer.play()
	get_tree().quit()
	pass # Replace with function body.


func _on_timer_timeout():
	
	$AudioStreamPlayer2D.play()
	pass # Replace with function body.


func _on_options_pressed():
	$AudioStreamPlayer.play()
	$OptionMenu.show()
	
	pass # Replace with function body.


func _on_texture_button_pressed():
	$AudioStreamPlayer.play()
	$OptionMenu.hide()
	pass # Replace with function body.


func _on_levels_pressed():
	LoadScene.load_screen_to_scene("res://Scenes/MenuScreen/select_level.tscn", {"test": "f"})
	pass # Replace with function body.
