extends CharacterBody2D
var runonce15 = true
func _physics_process(delta):
	if FlowC1.Lvl5CorrectAnswer15 and runonce15:
		$CollisionShape2D.disabled = true
		$"../AnimationPlayer".play("Off")
		$"..".play("Off")
		runonce15 = false
		print("Off")
	pass
	
