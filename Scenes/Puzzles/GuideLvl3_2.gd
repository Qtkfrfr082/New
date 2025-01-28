extends Control
var guide = false
var duration = 3.0
var guide_step = 1
var runonce = true
# Called when the node enters the scene tree for the first time.
func _ready():
	$RichTextLabel.show()
	if runonce:
		
		$Timer.start(duration)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if guide and event is InputEventMouseButton and event.pressed:
		handle_guide_step()

func handle_guide_step():
	match guide_step:
		1:
			$RichTextLabel2.show()
			
			guide_step += 1
		2:
			$RichTextLabel2.hide()
			$RichTextLabel3.show()
			guide_step += 1
		3:
			$RichTextLabel3.hide()
			guide = false
			guide_step = 1
			pass
					
				
				
	
	pass


func _on_timer_timeout():
	
	guide = true
	handle_guide_step()
	$Timer.stop()
	runonce = false
	pass # Replace with function body.


func _on_help_button_pressed():
	handle_guide_step()
	guide = true
	pass # Replace with function body.
