extends CharacterBody2D
var npc1 = false
var update_health
const SPEED = 155.0
const JUMP_VELOCITY = -350.0
var input_vector: Vector2 = Vector2.ZERO
var start_position : Vector2 = Vector2(0, 0)
var spawningduration = 2.0
var is_dying = false
var not_died = true
var run0 = true
var run1 = true
var run2 = true
const KNOCKBACK_DISTANCE = 50
const KNOCKBACK_FORCE = 500
const KNOCKBACK_DURATION = 0.2
var is_being_knocked_back = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#@onready var Intear = get_node("../../NPC/Actionable")
#@onready var Intear = PlayerData.NpcInteract

@onready var AP = $AnimationPlayer
@onready var playerhits = get_node("CanvasLayer")
func _ready():
	playerhits.show()
	
	
	$SpawnTime.start()
	$Spawn.play()
	$CPUParticles2D.show()
	$CPUParticles2D.emitting = true
	#Intear.add_to_group("interactable")
pass

func _physics_process(delta):
	
	var HEALTH = get_node("CanvasLayer/TextureProgressBar")
	#print(PlayerData.Health)
	

	# Move and slide
	if is_dying:
		#THis is for when dies and why is it here because it needs to be check first 
		return
		#From here would be the hp for the player( this doesnt work well too sometimes progress bar health not accurate updating)
	if PlayerData.Health == 20:
		if run0:
			$Hurt.play()
			var tween = get_tree().create_tween()
			tween.tween_property(HEALTH, "value", 20,0 ).set_trans(Tween.TRANS_LINEAR)
			playerhits.PlayerHit()
			run0 = false
		
	elif PlayerData.Health == 10:
		if run1:
			$Hurt.play()
			var tween = get_tree().create_tween()
			tween.tween_property(HEALTH, "value", 10,0 ).set_trans(Tween.TRANS_LINEAR)
		
			playerhits.PlayerHit()
			run1 = false
			
	elif PlayerData.Health == 0:
		if run2:
			$Hurt.play()
			var tween = get_tree().create_tween()
			tween.tween_property(HEALTH, "value", 0,0 ).set_trans(Tween.TRANS_LINEAR)
			$Hurt.play()
			playerhits.PlayerHit()
			run2 = false
		#Death will call when gets to zero 
			not_died = false
			get_node("AnimationPlayer").play("Death")
			update_health = PlayerData.Health
			deathh()

	
	if is_being_knocked_back:
		move_and_slide()
	else:
		if PlayerData.can_move:
			if not is_on_floor():
				
				velocity.y += gravity * delta
				
		# Handle Jump.
			if Input.is_action_just_pressed("Jump")and is_on_floor():
				
			
				velocity.y = JUMP_VELOCITY
				AP.play("Jump")
				$Jumping.play()
			
			var direction = Input.get_axis("Run_Left", "Run_Right")
		
			if direction == -1:
				get_node("Sprite2D").flip_h = true
				$TrailsRight.emitting = true
			elif direction == 1:
				get_node("Sprite2D").flip_h = false
				$TrailsLeft.emitting = true
			if direction:
			
				velocity.x = direction * SPEED
				if velocity.y == 0:
					AP.play("Run")
					
				#This is for running sounds change according to yours if the sound doesnt match to your player
				if $Timer.time_left <= 0:
						@warning_ignore("narrowing_conversion")
						$Running.pitch_scale = randi_range(8.8,1.2)
						$Running.play()
						$Timer.start(0.48)#here you will change it to match the footsteps
						print("sound")
			else:
				velocity.x = move_toward(velocity.x, 0, SPEED)
				if velocity.y == 0:
						AP.play("Idle")
			move_and_slide()
			
		return
		
#func _unhandled_input(_event: InputEvent) -> void:
	#this is for the dialgue checking if player near to npc before Q dialgue key to be available to press ( this help for not getting error when not near)
	#if Input.is_action_just_pressed("Dialogue"):
		#var actionables = actionable_finder.get_overlapping_areas()
		#if actionables.size() > 0:
		#for Intear in actionables:
			#if Intear.is_in_group("interactable"):
			# Node is in the group
				#print("Node is interactable")
				#actionables[0].action()
				#input_vector = Vector2.ZERO
				#PlayerData.can_move = false
				#return
			
		#print("no overlap")


func deathh():
	if is_dying:
		return
	is_dying = true
	$DeathTimer.start()
	
	not_died = false
	get_node("AnimationPlayer").play("Death")
	print("play")
	
	$DiedScreen.show()
func _on_death_timer_timeout():
	print("diee")
	get_tree().reload_current_scene()
	
	PlayerData.Health = 30
	#Go back to starting point but reloads the whole game





func _on_body_body_entered(body):
	if PlayerData.Health > 10 and body.is_in_group("Enemies"):
		if body.is_in_group("Enemies"):
			var direction = (global_position - body.global_position).normalized()
			global_position += direction * 10
			knockback(body)
		
	return
	

func knockback(body):
	if is_being_knocked_back:
		return

	is_being_knocked_back = true
	PlayerData.can_move = false
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
	is_being_knocked_back = false
	PlayerData.can_move = true
	velocity = Vector2.ZERO




