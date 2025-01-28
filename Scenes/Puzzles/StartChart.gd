extends Panel
class_name Slot

@onready var texture_rect = $TextureRect
var filled : bool = false
var Slot_Data = "0"

func _get_drag_data(at_position):
	var preview_texture = get_preview()
	preview_texture.modulate = Color(1, 1, 1, 0.5)  # Set transparency while dragging
	$"../../AudioStreamPlayer".play()
	set_drag_preview(preview_texture)
	return texture_rect

func _can_drop_data(_pos, data):
	# Check if can drop into textureRect
	return data is TextureRect
	
func _drop_data(_pos, data):
	# Drop the current texture 
	var temp = texture_rect.property
	texture_rect.property = data.property
	data.property = temp
	$"../../AudioStreamPlayer2".play()

func get_preview():
	# To get view the current object while dragging 
	var preview_texture = TextureRect.new()
	preview_texture.texture = texture_rect.texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(100, 50)

	var preview = Control.new()
	preview.add_child(preview_texture)
	
	return preview

func set_property(data):
	# Store the texture property and exchange data between get and drop
	texture_rect.property = data
	
	if data["TEXTURE"] == null:
		filled = false
	else:
		filled = true
