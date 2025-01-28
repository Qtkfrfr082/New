extends Area2D
const Balloon = preload("res://addons/dialogue_manager/example_balloon/example_balloon.tscn")
var player_inside
var runonce = true
#This is dialouge script

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "Guide1"
var dialogue_active = false

	
func MemoShow():
	var balloon: Node = Balloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(dialogue_resource, dialogue_start)
	dialogue_active = true
	
	print("Mag Dialogue")
func _on_body_entered(body):
	if body.name == "Player" and runonce:
		MemoShow()
		player_inside = true
		runonce = false
		print("inside2")

	pass


func _on_body_exited(body):
	if body.name == "Player":
		
		player_inside = false
		dialogue_active = false
	pass
