extends Area2D
const Balloon = preload("res://addons/dialogue_manager/example_balloon/example_balloon.tscn")
var player_inside
#This is dialouge script

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "Memo5"
func _process(_delta):
	if player_inside and Input.is_action_just_pressed("interact"):
			MemoShow()
	pass
	
func MemoShow():
	var balloon: Node = Balloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(dialogue_resource, dialogue_start)
	print("Mag Dialogue")
func _on_body_entered(body):
	if body.name == "Player":
		$Interact.show()
		$Interact.play("interact")
		player_inside = true
		print("inside2")

	pass # Replace with function body.


func _on_body_exited(body):
	if body.name == "Player":
		$Interact.hide()
		player_inside = false
	pass # Replace with function body.
