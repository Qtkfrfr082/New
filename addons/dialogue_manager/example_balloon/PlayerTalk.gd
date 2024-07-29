extends Control


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if FlowC1.PlayerTalk:
		self.visible = true
		$AnimatedSprite2D.play("Talking")
	else:
		self.hide()
		$AnimatedSprite2D.stop()
