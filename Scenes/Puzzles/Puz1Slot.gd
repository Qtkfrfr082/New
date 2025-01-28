extends Node2D
#store correct label number for matching data
var label_number1 = "1"
var label_number2 = "2"
var label_number3 = "3"
var label_number4 = "4"
var label_number5 = "5"
var Arranged = false
#this is checking after correctly arrange flowchart
var slot1 = false
var slot2 = false
var slot3 = false
var slot4 = false
var slot5 = false

@onready var Slot1 = get_node("Objects/Slot1/TextureRect/Slot1")
@onready var Slot2 = get_node("Objects/Slot2/TextureRect/Slot1")
@onready var Slot3 = get_node("Objects/Slot3/TextureRect/Slot1")
@onready var Slot4 = get_node("Objects/Slot4/TextureRect/Slot1")
@onready var Slot5 = get_node("Objects/Slot5/TextureRect/Slot1")
#this is for light indicator
@onready var point_light = get_node("Lever/LightSwitch/Red")
@onready var point_light2 = get_node("Lever/LightSwitch/Green")
#modifier for light flickering
var min_intensity = 0.5
var max_intensity = 1.5
var flicker_speed = 10.0
var flicker_enabled = false
var time_accumulator = 1.0


func _on_x_button_pressed():
	#button for exiting 
	PlayerData.can_move = true
	$".".hide()
	reset_puzzle_state()
	pass
	
func _physics_process(delta):
	#storing data of every slot
	var SlotData1 = get_node("Objects/Slot1/TextureRect/Slot1")
	var SlotDataA = SlotData1.text
	
	var SlotData6 = get_node("Objects/Slot1/TextureRect/Sign")
	var SlotDataF = SlotData6.text
	
	var SlotData2 = get_node("Objects/Slot2/TextureRect/Slot1")
	var SlotDataB = SlotData2.text
	
	var SlotData7 = get_node("Objects/Slot1/TextureRect/Sign")
	var SlotDataG = SlotData7.text
	
	var SlotData3 = get_node("Objects/Slot3/TextureRect/Slot1")
	var SlotDataC = SlotData3.text
	
	var SlotData4 = get_node("Objects/Slot4/TextureRect/Slot1")
	var SlotDataD = SlotData4.text
	
	var SlotData5 = get_node("Objects/Slot5/TextureRect/Slot1")
	var SlotDataE = SlotData5.text
	
	if flicker_enabled:
		time_accumulator += delta
		var intensity_variation =(sin(time_accumulator * flicker_speed) + 1) / 2  # Sine wave between 0 and 1
		point_light.energy = lerp(min_intensity, max_intensity, intensity_variation)
	
	#realtime checking slotdata
	if label_number1 == SlotDataA:
		#execute electric
		$LightIndi/Arrow1.show()
		slot1 = true
		if label_number2 == SlotDataB:
			$LightIndi/Arrow2.show()
			slot2 = true
			if label_number3 == SlotDataC:
				$LightIndi/Arrow3.show()
				slot3 = true
				if label_number4 == SlotDataD:
					$LightIndi/Arrow4.show()
					slot4 = true
					if  label_number5 == SlotDataE:
		
						slot5 = true
						HasBeenArranged()
						
						
					else:
						slot5 = false
				else:
					slot4 = false
					$LightIndi/Arrow4.hide()
			else:
				slot3 = false
				$LightIndi/Arrow3.hide()
		else:
			slot2 = false
			$LightIndi/Arrow2.hide()
	else:
		slot1 = false
		$LightIndi/Arrow1.hide()
	
func HasBeenArranged():
	if Slot1 || Slot2 || Slot3 || Slot4 || Slot5:
		
		Arranged = true
		print("Arrange")
	else:
		print("Not")
		
	


	
	
func start_flicker():
	flicker_enabled = true

func stop_flicker():
	flicker_enabled = false
	


func _on_on_lever_pressed():
	if Arranged:
		$AudioStreamPlayer4.play()
		$AudioStreamPlayer3.play()
		point_light.hide()
		point_light2.show()
		$Lever/Switch.play("On")
		FlowC1.activated = true
		FlowC1.Puz1 = true
		
	else:
		$AudioStreamPlayer5.play()
		$AudioStreamPlayer4.play()
		$Lever/Switch.play("Off")
		print("off")
		start_flicker()
	pass # Replace with function body.
func reset_puzzle_state():
	# Reset any state variables to their initial values
	Arranged = false
	slot1 = false
	slot2 = false
	slot3 = false
	slot4 = false
	slot5 = false
	flicker_enabled = false
	point_light.energy = max_intensity  # Reset light intensity
	point_light2.hide()
	point_light.show()
	# Hide all arrows
	$LightIndi/Arrow1.hide()
	$LightIndi/Arrow2.hide()
	$LightIndi/Arrow3.hide()
	$LightIndi/Arrow4.hide()
