extends Node2D

var parameters: Dictionary
var Duration = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	var LevelTitle = get_node("PlayerNode/Player/CanvasLayer/TitleAnim")
	LevelTitle.play("Level2")
	start_cooldown_timer()
	PlayerData.can_move = false
	pass # Replace with function body.
	


func start_cooldown_timer():
	# Start a timer to reset the teleporting state after the cooldown period
	$MusicTimer.start(Duration)
func _on_music_timer_timeout():
	
	$AudioStreamPlayer.play()
	$MusicTimer.stop()
	PlayerData.can_move = true
	pass # Replace with function body.

func _on_audio_stream_player_2d_finished():
	start_cooldown_timer()
	pass # Replace with function body.
