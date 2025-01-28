extends CharacterBody2D
var runonce14 = true
func _physics_process(delta):
	if FlowC1.Lvl5CorrectAnswer14 and runonce14:
		$CollisionShape2D.disabled = true
		$"../AnimationPlayer".play("Off")
		$"..".play("Off")
		runonce14 = false
		print("Off")
	pass
	
