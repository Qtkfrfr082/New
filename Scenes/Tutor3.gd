extends Area2D
var Duration = 0.5
var runonce = true
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	pass

func _on_body_entered(body):
	if body.name == "Player" and runonce:
		var idle = get_node("../../PlayerNode/Player/AnimationPlayer")
		idle.play("Idle")
		runonce = false
		PlayerData.can_move = false
		print("f")
		start_cooldown_timer()
	pass # Replace with function body.
func start_cooldown_timer():
	# Start a timer to reset the teleporting state after the cooldown period
	$Timer.start(Duration)
	

func _on_timer_timeout():
	var MoveEt = get_node("../../PlayerNode/Player/CanvasLayer/MovementTuto")
	MoveEt.movement4()
	
	$Timer.stop()
	pass # Replace with function body.


func _on_body_exited(_body):
	$Timer.stop()
	
	pass # Replace with function body.

