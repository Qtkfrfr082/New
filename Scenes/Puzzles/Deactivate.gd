extends Area2D


# Called when the node enters the scene tree for the first time.
var runonce = true


func _on_body_entered(body):
	if body.name == "Player" and runonce:
		FlowC1.activated = false
		FlowC1.Puz1 = false
		runonce = false
	pass # Replace with function body.
