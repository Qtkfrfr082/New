extends CharacterBody2D
var runonce10 = true
func _physics_process(delta):
	if FlowC1.Lvl5CorrectAnswer10 and runonce10:
		$CollisionShape2D.disabled = true
		$"../AnimationPlayer".play("Off")
		$"..".play("Off")
		runonce10 = false
		print("Off")
	pass
	
