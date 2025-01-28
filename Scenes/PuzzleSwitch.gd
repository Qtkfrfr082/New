extends Area2D

var player_inside
# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_inside and Input.is_action_just_pressed("interact"):
			$"../../../PlayerNode/Player/PuzzleChart".show()
	pass
	
	


func _on_body_entered(body):
	pass # Replace with function body.
