extends CharacterBody2D
var runonce8 = true
func _physics_process(delta):
	if FlowC1.Lvl5CorrectAnswer8 and runonce8:
		$CollisionShape2D.disabled = true
		$"../AnimationPlayer".play("Off")
		$"..".play("Off")
		runonce8 = false
		print("Off")
	pass
	
