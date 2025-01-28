extends CharacterBody2D
var runonce12 = true
func _physics_process(delta):
	if FlowC1.Lvl5CorrectAnswer12 and runonce12:
		$CollisionShape2D.disabled = true
		$"../AnimationPlayer".play("Off")
		$"..".play("Off")
		runonce12 = false
		print("Off")
	pass
	
