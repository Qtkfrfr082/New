extends CanvasLayer
var Paus = true

func _process(_delta):
	pass


func _on_continue_pressed():
	#Buttone to resume
	if Paus:
		
		self.hide()
		$AudioStreamPlayer.play()
		Engine.time_scale = 1
	
	pass # Replace with function body.


func _on_restart_pressed():
	#This is restart (PS; This is not working well when gets back to home and play again, it doesnt load the game after)
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_quit_pressed():
	#This will quit to menu but when play again it doenst load the game too
	
	Engine.time_scale = 1
	#get_tree().change_scene_to_file("res://Menu/Menu.tscn")
	#LoadScene.load_screen_to_scene("res://Menu/Menu.tscn", {"test": "f"})
	





