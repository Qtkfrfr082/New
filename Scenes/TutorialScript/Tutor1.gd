extends Area2D

var Duration = 3.0
var runonce = true
# Called when the node enters the scene tree for the first time.


func _process(_delta):
	
	pass

func _on_body_entered(body):
	if body.name == "Player" and runonce:
		var idle = get_node("../../PlayerNode/Player/AnimationPlayer")
		idle.play("Idle")
		$"../../PlayerNode/Player/TutorialText/Jump".show()
		runonce = false
		PlayerData.can_move = false
		print("f")
		start_cooldown_timer()
	pass # Replace with function body.
func start_cooldown_timer():
	
	$Timer.start(Duration)
	

func _on_timer_timeout():
	PlayerData.can_move = true
	$Timer.stop()
	pass # Replace with function body.


func _on_body_exited(_body):
	$"../../PlayerNode/Player/TutorialText/Jump".hide()
	$Timer.stop()
	
	pass # Replace with function body.
