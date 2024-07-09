extends Node2D

func movement():
	print("Luu")
	$NinePatchRect.show()
	$AnimationPlayer.play("Move")
	PlayerData.can_move = false
	
func movement2():
	print("jump")
	$NinePatchRect3.show()
	$AnimationPlayer.play("jump")
	PlayerData.can_move = false

func movement3():
	$NinePatchRect2.show()
	$AnimationPlayer.play("Interact")
	PlayerData.can_move = false
	
func movement4():
	$NinePatchRect4.show()
	$AnimationPlayer.play("Teleport")
	PlayerData.can_move = false
	
func _on_animation_player_animation_finished(_body):
	PlayerData.can_move = true
	pass # Replace with function body.
