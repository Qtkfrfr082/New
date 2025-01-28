extends PointLight2D  # Use OmniLight if you're in a 3D project

# Exported variables to adjust flicker behavior
@export var min_flicker_time: float = 0.01  # Minimum flicker interval (fast flickering)
@export var max_flicker_time: float = 0.1   # Maximum flicker interval (fast flickering)
@export var min_intensity: float = 1.0
@export var max_intensity: float = 1.45

var time_to_flicker: float = 0.0

func _ready():
	# Initialize the time to flicker
	_set_flicker_interval()

func _process(delta):
	# Decrease the time to flicker
	time_to_flicker -= delta
	
	# Check if it's time to flicker
	if time_to_flicker <= 0:
		# Randomly change the light's intensity
		energy = randf_range(min_intensity, max_intensity)
		
		# Reset the time to flicker
		_set_flicker_interval()

func _set_flicker_interval():
	# Set the time to the next flicker with fast flickering interval
	time_to_flicker = randf_range(min_flicker_time, max_flicker_time)
