extends Area2D
const Balloon = preload("res://addons/dialogue_manager/example_balloon/example_balloon.tscn")

#This is dialouge script
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "DoubleJump"
var runonce = true
func _on_body_entered(_body):
	if runonce:
		var balloon: Node = Balloon.instantiate()
		get_tree().current_scene.add_child(balloon)
		balloon.start(dialogue_resource, dialogue_start)
		print("Mag Dialogue")
		runonce = false

	pass # Replace with function body.




func _on_body_exited(body):
	FlowC1.Tutorial = false
	pass # Replace with function body.
