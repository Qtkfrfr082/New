extends AnimatedSprite2D
var player_inside = false
#var interaction_scene = preload("res://Level 1 Puzz/flow_puz.tscn")
var hud

func _ready():
	self.visible = false
	hud = get_node("../../../Player/Player/CanvasLayer")
	#This is the script for interaction notice 
	

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		player_inside = true
		self.visible = true
		self.play("Interaction_Comp")
	
  
func _on_area_2d_body_exited(body):
	if body.name == "Player":
		player_inside = false
		self.visible = false
		print("Exit")
	pass 
func _process(delta):
	#Interaction Function only runs when player inside the area
	if player_inside and Input.is_action_just_pressed("Interact"):
		#var interaction_instance = interaction_scene.instantiate()
		#get_tree().get_root().add_child(interaction_instance)
		#hide_hud_elements()
		#print("EYyy")
		pass
func hide_hud_elements():
	#to hide hud of player while interacting 
	hud.visible = false
