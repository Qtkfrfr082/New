extends Node2D

var parameters: Dictionary
var Duration = 2
# Called when the node enters the scene tree for the first time.
func _ready():
	var LevelTitle = get_node("PlayerNode/Player/CanvasLayer/TitleAnim")
	LevelTitle.play("Level4")
	PlayerData.can_move = false
	start_cooldown_timer()
	pass # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.

func start_cooldown_timer():
	$MusicTimer.start(Duration)
func _on_music_timer_timeout():
	
	$AudioStreamPlayer.play()
	$MusicTimer.stop()
	PlayerData.can_move = true
	pass # Replace with function body.



func _on_audio_stream_player_finished():
	start_cooldown_timer()
	pass # Replace with function body.
