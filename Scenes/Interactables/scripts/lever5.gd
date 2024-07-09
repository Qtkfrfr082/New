extends Node2D

var player_inside = false
var switch_on = true

func _process(delta):
	if player_inside and Input.is_action_just_pressed("interact") and switch_on:
		toggle_switch()

func toggle_switch():
	
	$Off.hide()
	$On.show()
	var tpon = get_node("../../Teleport/CPUParticles2D3")

	tpon.emitting = true
	switch_on = false

func _on_area_2d_body_entered(body):
	if body.name == "Player" and switch_on:
		$"inter1".show()
		$"inter1".play("Interact")
		player_inside = true
		print("inside2")
func _on_area_2d_body_exited(body):
	if body.name == "Player":
		$"inter1".hide()
