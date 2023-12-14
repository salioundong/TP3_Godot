extends Control

var fpsLabel : Label
var memoryLabel : Label
var processLabel : Label
var nodeLabel : Label

var _is_debug:bool = false:
	set = set_debug

func set_debug(value:bool) ->void:
	_is_debug = value
	visible = _is_debug
	

func _ready():
	fpsLabel = get_node("fpsLabel")
	memoryLabel = get_node("memoryLabel")
	processLabel = get_node("processLabel")
	nodeLabel = get_node("nodeLabel")
	
func _process(_delta):
	if Input.is_action_pressed("debug"):
		_is_debug = not _is_debug

	if _is_debug:
		var fps = "FPS: " + str(GameController.getFPS())
		var staticMemory = "Mémoire statique: " + str(String.humanize_size( OS.get_static_memory_usage()))
		var process = "Utilisation du processeur: " + str(Engine.get_process_frames()) + " ms"
		var nodes = "Nombre de noeuds utilisés: " + str(get_tree().get_node_count())
 
		fpsLabel.text = fps 
		memoryLabel.text = staticMemory
		processLabel.text = process
		nodeLabel.text = nodes
	
