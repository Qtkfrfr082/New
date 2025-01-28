extends CharacterBody2D
var runonce16 = true
func _physics_process(delta):
	if FlowC1.Lvl5CorrectAnswer16 and runonce16:
		$CollisionShape2D.disabled = true
		$"../AnimationPlayer".play("Off")
		$"..".play("Off")
		runonce16 = false
		print("Off")
	pass
	
