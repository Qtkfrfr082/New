extends CharacterBody2D
var runonce17 = true
func _physics_process(delta):
	if FlowC1.Lvl5CorrectAnswer17 and runonce17:
		$CollisionShape2D.disabled = true
		$"../AnimationPlayer".play("Off")
		$"..".play("Off")
		runonce17 = false
		print("Off")
	pass
	
