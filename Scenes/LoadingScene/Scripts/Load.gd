extends CanvasLayer
@export_file("*.tscn") var next_scene_path: String # Determines which scene to load
@export var parameters: Dictionary # Temporarily stores parameters to be passed to target scene

var texts = [
"Java is a versatile, object-oriented programming language known for its platform independence, robustness, and extensive standard library.",
"A flowchart in the context of Java typically refers to a visual representation of the logical flow of a Java program. It's a diagrammatic representation that illustrates the steps or sequence of operations involved in executing a Java program.", 
"Flowcharts serve as a helpful tool for planning, understanding, and communicating the structure and flow of a Java program."];

func _ready():
	var random_index = randi() % texts.size()
	$Label.text = texts[random_index]
	ResourceLoader.load_threaded_request(next_scene_path)
	print("Start Loading")
	
func _process(_delta):
	var progress_bar = get_node("ProgressBar")
	var tween = get_tree().create_tween()
	tween.tween_property(progress_bar, "value", 100,2 ).set_trans(Tween.TRANS_LINEAR)
	if ResourceLoader.load_threaded_get_status(next_scene_path) == ResourceLoader.THREAD_LOAD_LOADED: # Checks to see if the file is finished loading
		print("Loaded")
		set_process(false) # Stops the process function; otherwise this block will be called multiple times and cause errors
		await get_tree().create_timer(15).timeout # Added a delay for testing purposes. Can be removed in the final game.
		var new_scene: PackedScene = ResourceLoader.load_threaded_get(next_scene_path) # Gets the loaded scene, which is packed, so it'll have to be manually instantiated
		
		var new_node = new_scene.instantiate() # Instantiates a copy of the loaded scene
		new_node.parameters = parameters # Assigns parameters to new scene
		
		var current_scene = get_tree().current_scene # Stores the currently active scene, so we can replace it later
		get_tree().get_root().add_child(new_node) # Adds the new scene to the scene tree. This MUST happen before assigning it as the current scene.
		get_tree().current_scene = new_node # Assigns our new scene as the current scene
		current_scene.queue_free() # Now we can remove the original scene
	else:
		
		print("Loading")
	pass
	



