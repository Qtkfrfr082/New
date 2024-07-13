extends CharacterBody2D

var SPEED = 100
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player 
var chase = false
@onready var Hurt = get_node("../../player/player/Node2D/AnimatedSprite2D")
func _ready():
	get_node("wolf").play("idle")
func _physics_process(delta):
	var enemy_velocity = Vector2.ZERO
	velocity.y += gravity * delta
	if chase == true:
		get_node("wolf").play("jump")
		if get_node("wolf").animation != ("death"):
			get_node("wolf").play("jump")
		player = get_node("../../player/player")
		var direction = (player.position - self.position).normalized()
		print("pusa", player.position)
		print("wolf", self.position)
		if direction.x > 0:
			velocity.x = direction.x * SPEED 
			get_node("wolf").flip_h = true
			print("right", direction.x)
		else:
			
			get_node("wolf").flip_h = false
			print("left" , direction.x)
		velocity.x = direction.x * SPEED 
	else: 
		if get_node("wolf").animation != ("death"):
			get_node("wolf").play("idle")
		velocity.x = 0
	move_and_slide()
	
func _on_detection_body_entered(body):
	if body.name == "player":
		chase = true

func _on_detection_body_exited(body):
	if body.name == "player":
		chase = false


func _on_playerdeath_body_entered(body):
	if body.name == "player":
		death()

func _on_playercollision_body_entered(body):
	if body.name == "player":
		Hurt.play("HurtRun")
		body.health -= 5
		
		death()

func death():
	chase = false
	get_node("wolf").play("death")
	await get_node("wolf").animation_finished
	self.queue_free()
