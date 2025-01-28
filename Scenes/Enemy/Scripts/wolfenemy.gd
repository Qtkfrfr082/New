extends CharacterBody2D

var SPEED = 120
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player 
var chase = false
var enhealth = 10
var is_alive = true
const KNOCKBACK_DISTANCE = 50
const KNOCKBACK_FORCE = 500
const KNOCKBACK_DURATION = 0.3
var hasRunOnce = false
@onready var area2d = $playerdeath
@onready var detection_area = $detection

var previous_position = Vector2.ZERO
const MOVEMENT_THRESHOLD = 1.0  # Adjust this value as needed

func _ready():
	$AnimationPlayer.play("idle")
	# Hide the enemy initially
	hide()
	previous_position = global_position

func _physics_process(delta):
	if not is_visible_in_tree():
	
		return

	if not hasRunOnce: 
		if PlayerData.Health == 0:
			print("lahh")
			var playerdie = get_node("../../../PlayerNode/Player/AnimationPlayer")
			var playerdiescreen = get_node("../../../PlayerNode/Player/DiedScreen")
			playerdiescreen.show()
			$AnimationPlayer.play("Death")
			hasRunOnce = true

	velocity.y += gravity * delta
	
	if chase:
		player = get_node("../../../PlayerNode/Player")
		var direction = (player.position - self.position).normalized()
		
		velocity.x = direction.x * SPEED 
		$Sprite2D.flip_h = direction.x > 0
		$PointLight2Dright.visible = direction.x > 0
		$PointLight2Dleft.visible = direction.x <= 0
		
	else: 
		velocity.x = 0

	move_and_slide()

	# Check if the enemy has moved since the last frame
	var current_position = global_position
	var has_moved = (current_position - previous_position).length() > MOVEMENT_THRESHOLD

	# Update animation based on movement
	if has_moved:
		if $AnimationPlayer.current_animation != "Death" and $AnimationPlayer.has_animation("Chase"):
				$AnimationPlayer.play("Chase")
		else:
			if $AnimationPlayer.current_animation != "Death" and $AnimationPlayer.has_animation("idle"):
				$AnimationPlayer.play("idle")
	# Update the previous position for the next frame
	previous_position = current_position

func _on_detection_body_entered(body):
	if body.name == "Player":
		print("Player detected")
		$CPUParticles2D.emitting = true
		chase = true
		show()  # Make the enemy visible when player is detected

func _on_detection_body_exited(body):
	if body.name == "Player":
		chase = false
		hide()  # Hide the enemy when player exits detection area

func _on_playerdeath_body_entered(body):
	if body.name == "Player":
		if PlayerData.Health >= 10:
			print("Player damaged")
			PlayerData.Health -= 10
			knockback(body)
			

func _on_playercollision_body_entered(body):
	if body.name == "Player":
		print("Enemy hit")
		enhealth -= 10
		
	if enhealth <= 0:
		print("Enemy died")
		death()
		chase = false

func death():
	
	chase = false
	
	$AnimationPlayer.play("Death")
	await $AnimationPlayer.animation_finished
	print("dying")
	is_alive = false
	queue_free()

func knockback(body):
	if is_alive:
		var direction = (global_position - body.global_position).normalized()
		direction.y = 0  # Ensure we're only applying horizontal knockback

		var tween = create_tween()
		tween.set_ease(Tween.EASE_OUT)
		tween.set_trans(Tween.TRANS_QUAD)
		
		tween.tween_method(apply_knockback_force, KNOCKBACK_FORCE, 0, KNOCKBACK_DURATION)
		tween.tween_callback(end_knockback)

		velocity = direction * KNOCKBACK_FORCE
		move_and_slide()

		
func apply_knockback_force(force):
	velocity = velocity.normalized() * force

func end_knockback():
	chase = true
	PlayerData.can_move = true
	velocity = Vector2.ZERO
