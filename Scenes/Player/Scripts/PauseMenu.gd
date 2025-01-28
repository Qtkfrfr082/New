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
		$TextureRect.hide()
	
	pass # Replace with function body.


func _on_restart_pressed():
	
	await get_tree().create_timer(0.1).timeout
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_quit_pressed():
	#This will quit to menu but when play again it doenst load the game too
	
	Engine.time_scale = 1
	#get_tree().change_scene_to_file("res://Menu/Menu.tscn")
	LoadScene.load_screen_to_scene("res://Scenes/MenuScreen/Menutscn.tscn", {"test": "f"})
	

func _on_options_pressed():
	$MarginContainer.hide()
	$OptionMenu.show()
	pass # Replace with function body.


func _on_texture_button_pressed():
	$OptionMenu.hide()
	$MarginContainer.show()
	pass # Replace with function body.
