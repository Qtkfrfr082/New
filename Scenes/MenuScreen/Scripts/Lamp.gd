extends PointLight2D

var original_energy : float = 10.0
var min_energy : float = 0.1
var max_energy : float = 0.5
var energy_change_speed : float = 2.0

var original_range : float = 10.0
var min_range : float = -100
var max_range : float = 5.0
var range_change_speed : float = 1.0


func _process(delta):
	# Decrease or increase the light energy over time
	self.energy += energy_change_speed * delta
	
	# Ensure the energy stays within the defined range
	if self.energy > max_energy:
		energy_change_speed = -energy_change_speed
		self.energy = max_energy
	elif self.energy < min_energy:
		energy_change_speed = abs(energy_change_speed)
		self.energy = min_energy
		
		self.range_z_min += range_change_speed * delta
	if self.range_z_min > max_range:
		range_change_speed = -range_change_speed
		self.range_z_min = max_range
	elif self.range_z_max < min_range:
		range_change_speed = abs(range_change_speed)
		self.range_z_max = min_range
