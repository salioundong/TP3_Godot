extends Node2D

var startTime = 60
var sec = startTime
var minute = 1

var butJoueur = 0
var butAdversaire = 0
@onready var ballon = Ballon	

func _process(_delta):
	if Input.is_action_just_pressed("cheat"):
		$Control/Timer2.stop()
		get_tree().change_scene_to_file("res://fin_de_jeu.tscn")

func _ready():
	$Control/Timer2.start()	
	pass

func game_time():
	if sec > 0:
		sec -= 1
		$Control/Timer.text = str(minute) + ":" + str(sec)
	else:
		sec = startTime - 1
		if minute > 0:
			minute -= 1
			$Control/Timer.text = str(minute) + ":" + str(sec)
		else:
			$Control/Timer2.stop()
			get_tree().change_scene_to_file("res://fin_de_jeu.tscn")

func _on_timer_timeout():
	game_time()
	pass # Replace with function body.


func _on_but_player_area_entered(_body):
	butAdversaire += 1
	$ScoreControlAdversaire/ScoreAdversaire.text = str(butAdversaire)



func _on_but_adversaire_area_entered(_body):
	butJoueur += 1
	$ScoreControlPlayer/ScorePlayer.text = str(butJoueur)
