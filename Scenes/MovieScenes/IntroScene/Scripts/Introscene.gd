extends CanvasLayer

var parameters: Dictionary
var timer_duration = 10.0 # Duration of the timer in seconds
var timer_running = false

# Called when the node enters the scene tree for the first time.
func _ready():
	#preload("res://Scenes/MovieScenes/IntroScene/IntroScene.ogv")
	
	start_timer()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer_running:
		timer_duration -= delta
		if timer_duration <= 0.0:
			timer_running = false
			timer_expired()
	pass
	
func start_timer():
	timer_running = true
	timer_duration = 10.0

func timer_expired():
	$AnimatedSprite2D.show()



func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/World.tscn")
	
	pass # Replace with function body.
