extends CharacterBody2D
var runonce6 = true
func _physics_process(delta):
	if FlowC1.Lvl5CorrectAnswer6 and runonce6:
		$CollisionShape2D.disabled = true
		$"../AnimationPlayer".play("Off")
		$"..".play("Off")
		runonce6 = false
		print("Off")
	pass
	
