extends Node

var butAdversaire : int = 0
var butJoueur : int = 0
var minute : int = 1
var sec : int = 60
var joueurPosition : Vector2 
var fps : float = 0.0

func _process(_delta):
	updateFPS()
	getJoueurPosition()
	
func getButAdversaire() -> int:
	return butAdversaire

func setButAdversaire(value: int) -> void:
	butAdversaire = value

func getButJoueur() -> int:
	return butJoueur

func setButJoueur(value: int) -> void:
	butJoueur = value

func getMinute() -> int:
	return minute

func setMinute(value: int) -> void:
	minute = value

func getSec() -> int:
	return sec

func setSec(value: int) -> void:
	sec = value
	
func getJoueurPosition() -> Vector2:
	return joueurPosition

func setJoueurPosition(value: Vector2) -> void:
	joueurPosition = value
	
func updateFPS() -> void:
	fps = Engine.get_frames_per_second()

func getFPS() -> float:
	return fps	
