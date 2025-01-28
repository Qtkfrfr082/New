extends CharacterBody2D
var runonce9 = true
func _physics_process(delta):
	if FlowC1.Lvl5CorrectAnswer9 and runonce9:
		$CollisionShape2D.disabled = true
		$"../AnimationPlayer".play("Off")
		$"..".play("Off")
		runonce9 = false
		print("Off")
	pass
	
