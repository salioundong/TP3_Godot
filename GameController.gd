extends Node

var butAdversaire : int = 0
var butJoueur : int = 0
var minute : int = 1
var sec : int = 60

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
