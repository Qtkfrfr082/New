extends Area2D

#This is script for a collision when player detect inside of it and dies instantly
func _on_body_entered(body):
	if body.name == "Player":
		print("Gumana?")
		if PlayerData.Health == 30:
			PlayerData.Health -= 30
		elif PlayerData.Health == 20:
			PlayerData.Health -= 20
		else:
			PlayerData.Health -= 10
	pass # Replace with function body.



