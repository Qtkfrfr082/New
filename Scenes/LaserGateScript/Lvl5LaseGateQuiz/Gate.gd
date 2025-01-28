extends CharacterBody2D
var runonce = true
func _physics_process(delta):
	if FlowC1.Lvl5CorrectAnswer and runonce:
		$CollisionShape2D.disabled = true
		$"../AnimationPlayer".play("Off")
		$"..".play("Off")
		runonce = false
		print("Off")
	pass
	
