extends Node2D

var parameters: Dictionary
var Duration = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	var LevelTitle = get_node("PlayerNode/TitleAnim")
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
	var StartHov = get_node("PlayerNode/Music/AnimationPlayer")
	StartHov.play("Music")
	$MusicTimer.stop()
	pass # Replace with function body.


func _on_animation_player_animation_finished(Music):
	var StartHov = get_node("PlayerNode/Music")
	StartHov.hide()
	pass # Replace with function body.
