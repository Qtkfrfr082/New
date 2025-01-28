extends CharacterBody2D
var runonce5 = true
func _physics_process(delta):
	if FlowC1.Lvl5CorrectAnswer5 and runonce5:
		$CollisionShape2D.disabled = true
		$"../AnimationPlayer".play("Off")
		$"..".play("Off")
		runonce5 = false
		print("Off")
	pass
	
