extends Node


# In your coin script



func _on_body_entered(body):
	if body.is_in_group("Player"):
		if self.is_in_group("double_jump_coin"):
			body.collect_double_jump_coin()
		queue_free()  # Remove the coin
	pass # Replace with function body.
