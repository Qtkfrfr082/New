extends CanvasLayer

var parameters: Dictionary


# Called when the node enters the scene tree for the first time.
func _ready():
	#preload("res://Scenes/MovieScenes/IntroScene/IntroScene.ogv")
	
	$AnimationPlayer.play("FadeIn")
	$Timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_button_pressed():
	LoadScene.load_screen_to_scene("res://Scenes/MenuScreen/Menutscn.tscn", {"test": "f"})
	print("Skip")
	$VideoStreamPlayer.paused = true
	pass # Replace with function body.


func _on_timer_timeout():
	$AnimatedSprite2D.show()
	pass # Replace with function body.
