extends CharacterBody2D

var SPEED = 120
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player 
var chase = false
var enhealth = 10
var is_alive = true
const KNOCKBACK_DISTANCE = 50
const KNOCKBACK_FORCE = 500
const KNOCKBACK_DURATION = 0.2
var hasRunOnce = false
@onready var enemy_sprite = $enemy
@onready var detection_area = $detection

var previous_position = Vector2.ZERO
const MOVEMENT_THRESHOLD = 1.0  # Adjust this value as needed

func _ready():
	enemy_sprite.play("idle")
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
			playerdie.play("Death")
			hasRunOnce = true

	velocity.y += gravity * delta
	
	if chase:
		player = get_node("../../../PlayerNode/Player")
		var direction = (player.position - self.position).normalized()
		
		velocity.x = direction.x * SPEED 
		enemy_sprite.flip_h = direction.x > 0
		$PointLight2Dright.visible = direction.x > 0
		$PointLight2Dleft.visible = direction.x <= 0
	else: 
		velocity.x = 0

	move_and_slide()

	# Check if the enemy has moved since the last frame
	var current_position = global_position
	var has_moved = (current_position - previous_position).length() > MOVEMENT_THRESHOLD

	# Update animation based on movement
	if enemy_sprite.animation != "death":
		if has_moved:
			enemy_sprite.play("chase")
		else:
			enemy_sprite.play("idle")

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

func death():
	chase = false
	enemy_sprite.play("death")
	await enemy_sprite.animation_finished
	queue_free()

func knockback(body):
	var direction = (global_position - body.global_position).normalized()
	direction.y = -1
	
	var tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_QUAD)
	
	tween.tween_method(apply_knockback_force, KNOCKBACK_FORCE, 0, KNOCKBACK_DURATION)
	tween.tween_callback(end_knockback)

	velocity = direction * KNOCKBACK_FORCE
	
func apply_knockback_force(force):
	velocity = velocity.normalized() * force

func end_knockback():
	
	PlayerData.can_move = true
	velocity = Vector2.ZERO
