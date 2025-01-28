extends TextureButton


# Called when the node enters the scene tree for the first time.

var confirm_dialog: ConfirmationDialog

func _ready():
	# Create the confirmation dialog when the scene loads
	confirm_dialog = ConfirmationDialog.new()
	confirm_dialog.title = "Warning!"
	confirm_dialog.ok_button_text = "Yes"
	confirm_dialog.cancel_button_text = "No"
	
	# Set a fixed size for the dialog
	confirm_dialog.size = Vector2(400, 100)  # Adjust size as needed
	confirm_dialog.set_flag(Window.FLAG_RESIZE_DISABLED, true)
	# Create a RichTextLabel for fancy text
	var rich_text = RichTextLabel.new()
	rich_text.bbcode_enabled = true
	rich_text.text = "[center][color=aqua]Selecting levels may affect your understanding of the story.[/color]\n\n[color=lime]Are you sure you want to proceed to Level 2?[/color][/center]"
	rich_text.fit_content = true
	
	rich_text.size = Vector2(380, 150)  # Adjust size as needed
	
	# Replace the default label with our RichTextLabel
	var old_label = confirm_dialog.get_label()
	var parent = old_label.get_parent()
	parent.remove_child(old_label)
	parent.add_child(rich_text)
	
	# Customize dialog appearance
	var stylebox = StyleBoxFlat.new()
	stylebox.bg_color = Color(0.1, 0.1, 0.1, 0.9)  # Dark background
	stylebox.border_color = Color(1, 0.5, 0, 1)  # Orange border
	stylebox.set_border_width_all(2)  # Set border width
	stylebox.corner_radius_top_left = 10
	stylebox.corner_radius_top_right = 10
	stylebox.corner_radius_bottom_left = 10
	stylebox.corner_radius_bottom_right = 10
	confirm_dialog.add_theme_stylebox_override("panel", stylebox)
	
	# Customize button colors
	var button_style = StyleBoxFlat.new()
	button_style.bg_color = Color(0.2, 0.2, 0.2, 1)
	button_style.border_color = Color(0.5, 0.5, 0.5, 1)
	button_style.set_border_width_all(1)  # Set border width
	confirm_dialog.add_theme_stylebox_override("button_normal", button_style)
	
	# Connect the confirmation signal
	confirm_dialog.confirmed.connect(_on_confirmation_confirmed)
	
	# Add the dialog to the scene
	add_child(confirm_dialog)

func _on_pressed() -> void:
	# Show the confirmation dialog
	confirm_dialog.popup_centered()

func _on_confirmation_confirmed():
	# This function is called when the user confirms
	LoadScene.load_screen_to_scene("res://Scenes/Level5.tscn", {"test": "f"})

func _on_mouse_entered():
	$"../../Lvl2".hide()
	$"../../Lvl1".hide()
	$"../../Lvl3".hide()
	$"../../Lvl4".hide()
	$"../../Lvl5".show()
	pass # Replace with function body.

