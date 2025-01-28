# AreaControl.gd
extends Area2D




func _on_Area2D_body_exited(body):
	
	pass
func _on_body_entered(body):
	if body.is_in_group("Player"):
		var normal_color: Color = Color(0.304, 0.304, 0.304, 1.0)
		var modulates = get_node("../../CanvasModulate")
		modulates.color = normal_color
		print("entered")
		pass # Replace with function body.
