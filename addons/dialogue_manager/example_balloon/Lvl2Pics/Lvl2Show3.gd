extends TextureRect


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if FlowC1.Lvl2Show3:
		self.visible = true
