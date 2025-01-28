extends Node2D


# Called when the node enters the scene tree for the first time.

func _physics_process(delta):
	if FlowC1.activated:
		$Path2D/AnimationPlayer.play("ElevateDown")
	pass

