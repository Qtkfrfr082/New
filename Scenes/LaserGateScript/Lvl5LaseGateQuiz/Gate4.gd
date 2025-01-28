extends CharacterBody2D
var runonce4 = true
func _physics_process(delta):
	if FlowC1.Lvl5CorrectAnswer4 and runonce4:
		$CollisionShape2D.disabled = true
		$"../AnimationPlayer".play("Off")
		$"..".play("Off")
		runonce4 = false
		print("Off")
	pass
	
