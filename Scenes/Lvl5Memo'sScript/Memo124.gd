extends Area2D
const Balloon = preload("res://addons/dialogue_manager/example_balloon/example_balloon.tscn")
var player_inside
#This is dialouge script
@onready var audio_player: AudioStreamPlayer = $"../../AudioStreamPlayer"
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "Memo124"
var dialogue_active = false
func _process(_delta):
	if FlowC1.EndGame:
		$CanvasLayer/ColorRect.show()
		lower_volume(-80.0)
		$AnimationPlayer.play("FadeInWhite")
		
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




func _on_animation_player_animation_finished(anim_name):
	var new_scene_path = "res://Scenes/outro.tscn"
	
	var result = get_tree().change_scene_to_file(new_scene_path)
	pass # Replace with function body.

func lower_volume(amount: float) -> void:
	# Lower the volume by the specified amount (in dB)
	audio_player.volume_db -= amount
