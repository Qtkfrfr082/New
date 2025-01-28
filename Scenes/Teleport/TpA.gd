extends Area2D

@onready var teleport_destination = get_node("../TpB")  # Adjust to TpA for the other node
@onready var collision_shape = $CollisionShape2D  # Reference to the collision shape
var is_teleporting = false
var cooldown_duration = 3.0
var available_tp = false

# Define an offset to move the player slightly away from the teleport area
 # Adjust this value as needed

func _on_body_entered(body):
	if body.is_in_group("Player") and not is_teleporting and available_tp:
		teleport_player(body)

func teleport_player(body):
	if teleport_destination:
		$"../Teleport".play()
		
		# Get the global position of the destination and add an offset
		var destination_position = teleport_destination.global_position 
		
		# Move the player to the destination position
		body.global_position = destination_position
		
		# Disable the collision shape to prevent immediate re-triggering
		collision_shape.disabled = true
		
		is_teleporting = true
		start_cooldown_timer()

func start_cooldown_timer():
	$"../Cooldown".start(cooldown_duration)

func _on_cooldown_timeout():
	is_teleporting = false
	available_tp = false  # Reset availability after cooldown to avoid instant re-teleportation
	
	# Re-enable the collision shape after the cooldown
	collision_shape.disabled = false

func _on_area_2d_body_entered(_body):
	available_tp = true
