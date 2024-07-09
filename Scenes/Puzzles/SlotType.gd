extends TextureRect

@export var slot_type: int = 0

@export var Slot = 0:
	set(value):
		Slot = value
		%Slot1.text = str(Slot)

@onready var property: Dictionary = {"TEXTURE" : texture,"SLOT" : Slot, "SLOT_TYPE" : slot_type}:
	set(value):
		property = value
 
		texture = property["TEXTURE"]
		Slot = property["SLOT"]
		slot_type = property["SLOT_TYPE"]

