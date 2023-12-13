extends Control

var debugLabel : Label
var fpsLabel : Label
var memoryLabel : Label
var showDebug : bool = true
#@onready var joueur = get_parent().get_node("")
# Called when the node enters the scene tree for the first time.
func _ready():
	debugLabel = get_node("debugLabel")
	fpsLabel = get_node("fpsLabel")
	memoryLabel = get_node("memoryLabel")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("debug"):
		showDebug = not showDebug

	if showDebug:
		var joueurPosition = "Position du joueur: " + str(GameController.getJoueurPosition())
		var fps = "FPS: " + str(GameController.getFPS())
		var staticMemory = "Mémoire statique: " + str(OS.get_static_memory_usage() / 1024.0) + " KB"
		#var dynamicMemory = "Mémoire dynamique: " + str(OS.get_dynamic_memory_usage() / 1024) + " KB"
		debugLabel.text = joueurPosition
		fpsLabel.text = fps 
		memoryLabel.text = staticMemory
	else:
		debugLabel.text = ""
		fpsLabel.text = ""
		memoryLabel.text = ""
