extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Move.bbcode_enabled = true
	$Move.text ="[center]Press[color=yellow] A [/color]and[color=yellow] D [/color]to move.[/center]"

	$Jump.bbcode_enabled = true
	$Jump.text ="[center]Press[color=yellow] SPACE [/color]to jump."
	
	$Interact.bbcode_enabled = true
	$Interact.text ="[center]Press[color=yellow] E [/color]to interact with this [color=yellow]?[/color]."
	
	
	
	
