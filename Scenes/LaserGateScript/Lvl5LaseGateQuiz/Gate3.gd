extends CharacterBody2D
var runonce3 = true
func _physics_process(delta):
	if FlowC1.Lvl5CorrectAnswer3 and runonce3:
		$CollisionShape2D.disabled = true
		$"../AnimationPlayer".play("Off")
		$"..".play("Off")
		runonce3 = false
		print("Off")
	pass
	
