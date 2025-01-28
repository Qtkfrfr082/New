extends Node2D

var player_inside = false
var switch_on = true

func _process(_delta):
	if player_inside and Input.is_action_just_pressed("interact") and switch_on:
		toggle_switch()

func toggle_switch():
	$Off/CharacterBody2D/Collision.disabled = true
	$Off.hide()
	$On.show()
	$"../Lever3".play()
	var offLaser = get_node("../../BarrierLaser/AnimatedSprite2D3/AnimationPlayer")
	offLaser.play("Off")
	var off = get_node("../../BarrierLaser/AnimatedSprite2D3")
	off.play("Off")
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
