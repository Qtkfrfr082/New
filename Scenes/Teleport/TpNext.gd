extends Area2D


var isTeleporting = false
var cooldownDuration = 2.0
var AvailableTp = false
func _on_body_entered(body):
	# Check if the body entered is the player (assuming it's a KinematicBody)
	if body.is_in_group("Player") and not isTeleporting and AvailableTp:
		# Get the destination node
			start_cooldown_timer()
			
func start_cooldown_timer():
	# Start a timer to reset the teleporting state after the cooldown period
	$"../Cooldown".start(cooldownDuration)

func _on_cooldown_timeout():
	AvailableTp = false
	isTeleporting = false
	
	pass # Replace with function body.



