extends Area2D

var down = true
var up = false
var player_inside = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_inside and Input.is_action_just_pressed("interact") and FlowC1.activated:
		toggle_switch()

func toggle_switch():
	var animation_player = $"../../AnimationPlayer"
	
	# Check if an animation is already playing
	if animation_player.is_playing():
		return
	
	# Only toggle state and play animation if the correct state is set
	if down and not up:
		animation_player.play("ElevateDown")
		$"../AnimatedSprite2D".play("Elevator")
		up = true
		down = false
		print("Down")
	elif up and not down:
		animation_player.play("ElevateUp")
		$"../AnimatedSprite2D".play("Elevator")
		up = false
		down = true
		print("Up")

func _on_body_entered(body):
	if body.name == "Player" and FlowC1.activated:
		$AnimatedSprite2D.show()
		$AnimatedSprite2D.play("interact")
		player_inside = true

func _on_body_exited(body):
	if body.name == "Player":
		$AnimatedSprite2D.hide()
		player_inside = false


func _on_animation_player_animation_finished(ElevateDown):
	$"../AnimatedSprite2D".stop()
	pass # Replace with function body.
