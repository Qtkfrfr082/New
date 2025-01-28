extends CharacterBody2D
var runonce7 = true
func _physics_process(delta):
	if FlowC1.Lvl5CorrectAnswer7 and runonce7:
		$CollisionShape2D.disabled = true
		$"../AnimationPlayer".play("Off")
		$"..".play("Off")
		runonce7 = false
		print("Off")
	pass
	
