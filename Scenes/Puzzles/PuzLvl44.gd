extends Area2D

var player_inside = false
var switch_on = true



func _process(_delta):
	if player_inside and Input.is_action_just_pressed("interact") and switch_on:
		toggle_switch()
		print("open")
	if FlowC1.Puz4:
		switch_on = false
func toggle_switch():
	$"../../PlayerNode/Player/CanvasLayerLvl4".show()
	$"../../PlayerNode/Player/CanvasLayerLvl4/PuzzleChart4".show()
	print("nagopen?")
	PlayerData.can_move = false


func _on_body_entered(body):
	if body.name == "Player" and switch_on:
		$Interact.show()
		$Interact.play("interact")
		player_inside = true
		print("inside2")
	pass # Replace with function body.


func _on_body_exited(body):
	if body.name == "Player":
		$Interact.hide()
		player_inside = false
	pass # Replace with function body.
