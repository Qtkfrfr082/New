extends Area2D
const Balloon = preload("res://addons/dialogue_manager/example_balloon/example_balloon.tscn")
var player_inside
#This is dialouge script

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "Memo58"
var dialogue_active = false
func _process(_delta):
	
	if player_inside and Input.is_action_just_pressed("interact") and not dialogue_active:
			MemoShow()
	pass
	
func MemoShow():
	var balloon: Node = Balloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(dialogue_resource, dialogue_start)
	dialogue_active = true
	
	print("Mag Dialogue")
func _on_body_entered(body):
	if body.name == "Player":
		$Interact.show()
		$Interact.play("interact")
		player_inside = true
		print("inside2")

	pass


func _on_body_exited(body):
	if body.name == "Player":
		$Interact.hide()
		player_inside = false
		dialogue_active = false
	pass
