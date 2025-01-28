extends CharacterBody2D
var runonce11 = true
func _physics_process(delta):
	if FlowC1.Lvl5CorrectAnswer11 and runonce11:
		$CollisionShape2D.disabled = true
		$"../AnimationPlayer".play("Off")
		$"..".play("Off")
		runonce11 = false
		print("Off")
	pass
	
