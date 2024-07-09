extends Control
var parameters: Dictionary
#this is script for Title Screen 

func _ready():
	$Timer.start()
	pass
func _on_start_button_pressed():
	LoadScene.load_screen_to_scene("res://Scenes/MovieScenes/IntroScene/IntroCut.tscn", {"test": "f"})
	
	pass # Replace with function body.

func _on_quit_button_pressed():
	get_tree().quit()
	pass # Replace with function body.



func _on_video_stream_player_finished():
	pass # Replace with function body.


func _on_timer_timeout():
	$AudioStreamPlayer2D.play()
	pass # Replace with function body.
