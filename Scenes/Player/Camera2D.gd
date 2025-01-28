extends Camera2D

var shake_duration = 0.5  # Total duration of the shake effect
var shake_magnitude = 10.0  # Maximum displacement for the shake effect

var shake_timer = 0.0  # Timer to track the shake duration
var original_position = Vector2.ZERO  # To store the original position of the camera

func _ready():
	original_position = position
	
func _process(delta):
	if shake_timer > 0:
		shake_timer -= delta
		# Apply shake effect by setting a random offset within the magnitude range
		position = original_position + Vector2(
			randf_range(-shake_magnitude, shake_magnitude),
			randf_range(-shake_magnitude, shake_magnitude)
		)
	else:
		# Reset the position to the original when shake effect is over
		position = original_position

# Call this function to start the shake effect
func start_shake(duration, magnitude):
	print("Shaking")
	shake_duration = duration
	shake_magnitude = magnitude
	shake_timer = duration
