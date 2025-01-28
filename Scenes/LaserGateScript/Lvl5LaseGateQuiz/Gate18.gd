extends CharacterBody2D
var runonce18 = true
func _physics_process(delta):
	if FlowC1.Lvl5CorrectAnswer18 and runonce18:
		$CollisionShape2D.disabled = true
		$"../AnimationPlayer".play("Off")
		$"..".play("Off")
		runonce18 = false
		print("Off")
	pass
	
