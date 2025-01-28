extends Node2D

var player_inside = false
var switch_on = true



func _process(_delta):
	if player_inside and Input.is_action_just_pressed("interact") and switch_on:
		toggle_switch()
		print("open")
	if FlowC1.Puz32:
		switch_on = false
func toggle_switch():
	$"../../../PlayerNode/Player/CanvasLayerLvl3".show()
	$"../../../PlayerNode/Player/CanvasLayerLvl3/PuzzleChart2".show()
	print("nagopen?")
	PlayerData.can_move = false
	

func _on_body_entered(body):
	if body.name == "Player" and switch_on:
		$"inter1".show()
		$"inter1".play("Interact")
		player_inside = true
		print("inside2")
	pass # Replace with function body.


func _on_body_exited(body):
	if body.name == "Player":
		$"inter1".hide()
		player_inside = false
	pass # Replace with function body.
