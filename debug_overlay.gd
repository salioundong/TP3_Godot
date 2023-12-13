extends Control

var debugLabel : Label

# Called when the node enters the scene tree for the first time.
func _ready():
	debugLabel = get_node("debugLabel")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):	
	debugLabel.text = "Position du joueur: " + str(GameController.getButJoueur())
