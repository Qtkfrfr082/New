extends CharacterBody2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player = false
var chase = true
var SPEED = 100
var count = 2.0
# Movement speed

func _physics_process(delta):
	if player:
		
		velocity.y += gravity * delta
		if chase == true:
			player = get_node("../Player")
			var direction = (player.position - self.position).normalized()
			if direction.x > 0:
				velocity.x = direction.x * SPEED
				$AnimatedSprite2D.flip_h = false
				$AnimatedSprite2D.play("Run")
			else:
				velocity.x = direction.x * SPEED
				$AnimatedSprite2D.flip_h = true
				$AnimatedSprite2D.play("Run")
			
		else: 
			
			velocity.x = move_toward(velocity.x, 0, SPEED)
			if velocity.y == 0:
					$AnimatedSprite2D.play("Idle")
					queue_free()
		move_and_slide()


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		start()
		pass
func start():
	$"../Timer".start(count)

func _on_timer_timeout():
	player = true
	
	pass # Replace with function body.
func free():
	if player:
		queue_free()
