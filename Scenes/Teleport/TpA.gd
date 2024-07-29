extends Area2D

@onready var TpB = get_node("../TpB")
var isTeleporting = false
var cooldownDuration = 2.0
var AvailableTp = false
func _on_body_entered(body):
	# Check if the body entered is the player 
	if body.is_in_group("Player") and not isTeleporting and AvailableTp:
		# Get the destination node
		var teleportDestinationNode = TpB #this is area2d node 
		print("insideee")
		# Check if the destination node exists
		if teleportDestinationNode:
			# Teleport the player to the destination node's position
			$"../Teleport".play()
			body.global_transform.origin = teleportDestinationNode.global_transform.origin
			isTeleporting = true
			
			start_cooldown_timer()

func start_cooldown_timer():
	# Start a timer to reset the teleporting state after the cooldown period
	$"../Cooldown".start(cooldownDuration)

func _on_cooldown_timeout():
	AvailableTp = false
	isTeleporting = false
	
	#reset to false
	pass # Replace with function body.


func _on_area_2d_body_entered(_body):
	#check player to be able to teleport before entering 
	AvailableTp = true
	print("true")
	pass # Replace with function body.
