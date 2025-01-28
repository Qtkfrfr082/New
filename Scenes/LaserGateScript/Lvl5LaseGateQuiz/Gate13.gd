extends CharacterBody2D
var runonce13 = true
func _physics_process(delta):
	if FlowC1.Lvl5CorrectAnswer13 and runonce13:
		$CollisionShape2D.disabled = true
		$"../AnimationPlayer".play("Off")
		$"..".play("Off")
		runonce13 = false
		print("Off")
	pass
	
