extends CanvasLayer

@onready var Pause = get_node("PauseMenu")
var is_paused = false
#@onready var Quest = get_node("QuestTab")
var Paus = false
var player
#This is Hud script for Pause and health 
func PlayerHit():
	if PlayerData.Health == 20:
		
		
		var tween = get_tree().create_tween()
		tween.tween_property($TextureProgressBar2, "value", 20,1 ).set_trans(Tween.TRANS_LINEAR)
		
		
		
	elif PlayerData.Health == 10:
		
		
		var tween = get_tree().create_tween()
		tween.tween_property($TextureProgressBar2, "value", 10,1 ).set_trans(Tween.TRANS_LINEAR)
		
		
		
		
	elif PlayerData.Health == 0:
		
		var tween = get_tree().create_tween()
		tween.tween_property($TextureProgressBar2, "value", 0,1 ).set_trans(Tween.TRANS_LINEAR)
		
	
func PauseMenu():
		#This will pause and stop time 
		
	is_paused = !is_paused
	
	if is_paused:
		# Show the pause menu
		Pause.show()
		$AudioStreamPlayer.play()
		Engine.time_scale = 0
		
		# Pause specific elements rather than everything
		get_tree().paused = true
	else:
		# Hide the pause menu
		Pause.hide()
		$AudioStreamPlayer.stop()
		Engine.time_scale = 1
		
		# Resume specific elements
		get_tree().paused = false
	
func QuestTab():
	#THis will show the quest tab
	#Quest.show()
	$AudioStreamPlayer.play()
	Engine.time_scale = 0
	Paus = !Paus

func _on_menu_pressed():
	#This will call the pause menu func
	
	PauseMenu()
	
	pass 


func _on_quest_pressed():
	#This will call the quest menu func
	QuestTab()
	pass
