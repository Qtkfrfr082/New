extends Node2D
var original_size = Vector2i(1280, 720)
var parameters: Dictionary
var Duration = 3
# Called when the node enters the scene tree for the first time.
func _ready():

	var LevelTitle = get_node("PlayerNode/Player/CanvasLayer/TitleAnim")
	LevelTitle.play("Level1")
	start_cooldown_timer()
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func start_cooldown_timer():
	# Start a timer to reset the teleporting state after the cooldown period
	$MusicTimer.start(Duration)
func _on_music_timer_timeout():
	
	$AudioStreamPlayer.play()
	$MusicTimer.stop()
	pass # Replace with function body.
func _on_audio_stream_player_finished():
	start_cooldown_timer()
	pass # Replace with function body.
