extends PointLight2D  # Use OmniLight if you're in a 3D project

# Exported variables to adjust flicker behavior
var min_flicker_time: float = 0.1
var max_flicker_time: float = 0.5
var min_intensity: float = 0.5
var max_intensity: float = 1.0

var time_to_flicker: float = 0.0

func _ready():
	# Initialize the time to flicker
	_set_next_flicker_time()

func _process(delta):
	# Decrease the time to flicker
	time_to_flicker -= delta
	
	# Check if it's time to flicker
	if time_to_flicker <= 0:
		# Randomly change the light's intensity
		energy = randf_range(min_intensity, max_intensity)
		
		# Reset the time to flicker
		_set_next_flicker_time()

func _set_next_flicker_time():
	# Set the time to the next flicker
	time_to_flicker = randf_range(min_flicker_time, max_flicker_time)
