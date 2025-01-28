extends CharacterBody2D
var runonce2 = true
func _physics_process(delta):
	if FlowC1.Lvl5CorrectAnswer2 and runonce2:
		$CollisionShape2D.disabled = true
		$"../AnimationPlayer".play("Off")
		$"..".play("Off")
		runonce2 = false
		print("Off")
	pass
	
