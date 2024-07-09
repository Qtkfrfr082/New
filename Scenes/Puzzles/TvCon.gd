extends Node2D

const GRID_SIZE = 5
var dot_spacing = 70  # Variable for the distance between dots
const DOT_RADIUS = 5
const COLOR_COUNT = 4
const LINE_WIDTH = 15  # Define the width of the lines

var grid = []
var current_line = []
var lines = []
var colors = [Color.RED, Color.GREEN, Color.BLUE, Color.YELLOW]
var start_dots = []
var end_dots = []

var colored_dot_positions = [  # Define the manual positions of colored dots
	{"color": Color.RED, "start": Vector2(0, 0), "end": Vector2(4, 0)},
	{"color": Color.GREEN, "start": Vector2(1, 2), "end": Vector2(4, 4)},
	{"color": Color.BLUE, "start": Vector2(2, 3), "end": Vector2(2, 2)},
	{"color": Color.YELLOW, "start": Vector2(0, 4), "end": Vector2(4, 1)}
]

var screen_center : Vector2
var time_passed = 0.0

func _process(delta):
	time_passed += delta
	$TextureRect.material.set_shader_parameter("time", time_passed)
	

func _ready():
	screen_center = get_viewport_rect().size / 2
	create_grid()
	place_colored_dots()
	$AnimatedSprite2D.play("Device")
	
	


func create_grid():
	var grid_offset = screen_center - Vector2(GRID_SIZE * dot_spacing / 2, GRID_SIZE * dot_spacing / 2)
	print("Grid Offset: ", grid_offset)
	for x in range(GRID_SIZE):
		for y in range(GRID_SIZE):
			var dot = {
				"position": grid_offset + Vector2(x * dot_spacing + dot_spacing / 2, y * dot_spacing + dot_spacing / 2),
				"connected": false,
				"color": Color.WHITE,
				"original_color": Color.WHITE,  # Store the original color
				"is_end": false,
				"grid_pos": Vector2(x, y)
			}
			print("Dot Position: ", dot.position)
			grid.append(dot)

func place_colored_dots():
	for dot_data in colored_dot_positions:
		var start_dot = get_dot_at(dot_data["start"])
		var end_dot = get_dot_at(dot_data["end"])
		
		start_dot.color = dot_data["color"]
		start_dot.original_color = dot_data["color"]  # Set the original color
		end_dot.color = dot_data["color"]
		end_dot.original_color = dot_data["color"]  # Set the original color
		end_dot.is_end = true
		
		start_dots.append(start_dot)
		end_dots.append(end_dot)

func _draw():
	for dot in grid:
		draw_circle(dot.position, DOT_RADIUS, dot.color)
	
	for line in lines:
		draw_path(line)
		
	if not current_line.is_empty():
		draw_path(current_line)

func draw_path(path):
	for i in range(path.size() - 1):
		
		draw_line(path[i].position, path[i + 1].position, path[0].color, LINE_WIDTH)
		
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
			
				start_drawing(event.position)
			else:
				end_drawing()
	elif event is InputEventMouseMotion:
		if not current_line.is_empty():
			update_line(event.position)

func start_drawing(position):
	var start_dot = get_closest_dot(position)
	if start_dot and (start_dot in start_dots or start_dot in end_dots) and not start_dot.connected:
		current_line = [start_dot]
		
		queue_redraw()

func update_line(position):
	var closest_dot = get_closest_dot(position)
	if closest_dot and closest_dot != current_line[-1] and is_adjacent(closest_dot, current_line[-1]):
		var current_color = current_line[0].color
		if (closest_dot.color == Color.WHITE or closest_dot.color == current_color) and not closest_dot.connected and not line_crosses_existing(current_line[-1], closest_dot):
			closest_dot.color = current_color
			current_line.append(closest_dot)
			$Bloop.play()
			queue_redraw()
		else:
			# Revert color to original color if the line is not valid
			for dot in current_line:
				dot.color = dot.original_color

func end_drawing():
	if current_line.size() > 1:
		var end_dot = current_line[-1]
		if (end_dot in end_dots or end_dot in start_dots) and end_dot.color == current_line[0].color and not end_dot.connected:
			for dot in current_line:
				dot.connected = true
				
			lines.append(current_line)
		else:
			# Revert color to original color if the line is not completed correctly
			for dot in current_line:
				dot.color = dot.original_color
		current_line = []
		queue_redraw()

func get_closest_dot(position):
	var closest_dot = null
	var min_distance = INF
	
	for dot in grid:
		var distance = position.distance_to(dot.position)
		if distance < min_distance and distance < dot_spacing / 2:
			min_distance = distance
			closest_dot = dot
	
	return closest_dot

func is_adjacent(dot1, dot2):
	return (dot1.grid_pos - dot2.grid_pos).length() == 1

func line_crosses_existing(dot1, dot2):
	var new_segment = [dot1.position, dot2.position]
	for line in lines:
		for i in range(line.size() - 1):
			if lines_intersect(new_segment, [line[i].position, line[i+1].position]):
				return true
	return false

func lines_intersect(line1, line2):
	var x1 = line1[0].x
	var y1 = line1[0].y
	var x2 = line1[1].x
	var y2 = line1[1].y
	var x3 = line2[0].x
	var y3 = line2[0].y
	var x4 = line2[1].x
	var y4 = line2[1].y
	
	var denom = (y4 - y3) * (x2 - x1) - (x4 - x3) * (y2 - y1)
	if denom == 0:
		return false
	
	var ua = ((x4 - x3) * (y1 - y3) - (y4 - y3) * (x1 - x3)) / denom
	var ub = ((x2 - x1) * (y1 - y3) - (y2 - y1) * (x1 - x3)) / denom
	
	return ua > 0 and ua < 1 and ub > 0 and ub < 1

func get_dot_at(grid_pos):
	for dot in grid:
		if dot.grid_pos == grid_pos:
			return dot
	return null

func _on_reset_pressed():
	$Bloop2.play()
	# Reset all dots to their original color and disconnect them
	for dot in grid:
		if dot not in start_dots and dot not in end_dots:
			dot.color = Color.WHITE
		else:
			dot.color = dot.original_color
		dot.connected = false
	
	# Clear all lines
	lines.clear()
	
	# Clear the current line being drawn
	current_line.clear()
	
	queue_redraw()
