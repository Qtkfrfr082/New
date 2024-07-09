extends Node
var can_move
var Health 
var Coins
var showtutor
# Called when the node enters the scene tree for the first time.
var NpcInteract
func _ready():
	#NpcInteract = get_node("NPC/Actionable/Actionable")
	showtutor = false
	can_move = true
	Health = 30
	Coins = 0
	
pass
