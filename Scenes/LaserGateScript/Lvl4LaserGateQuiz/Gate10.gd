extends CharacterBody2D
var runonce = true
func _physics_process(delta):
	if FlowC1.CorrectAnswer5 and runonce:
		$CollisionShape2D.disabled = true
		var offLaser = get_node("../AnimationPlayer")
		offLaser.play("Off")
		var off = get_node("..")
		off.play("Off")
		runonce = false
		
	pass
	
