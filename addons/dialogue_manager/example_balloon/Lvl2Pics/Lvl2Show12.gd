extends TextureRect
var scale_factor: float = 1.5

# Flag to track the original scale
var original_scale: Vector2

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if FlowC1.Lvl2Show12:
		self.visible = true
		
