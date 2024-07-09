extends Node2D

var player_inside = true
var switchon = true
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_inside and Input.is_action_just_pressed("interact") and switchon:
		$Lever2/CharacterBody2D/Collision.disabled = true
		$Lever2.play("On")
		var off = get_node("../../BarrierLaser/AnimatedSprite2D")
		off.play("Off")
		switchon = false
	pass
func _on_area_2d_2_body_entered(body):
	if body.name == "Player" and switchon:
		$"inter2".show()
		$"inter2".play("Interact")
		player_inside = true
		print("Entered")
func _on_area_2d_2_body_exited(body):
	
	$"inter2".hide()
	print("Exiteded2")
	pass # Replace with function body.





