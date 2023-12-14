extends Node2D

var startTime = 60
var sec = startTime
var minute = 1
var butJoueur = 0
var butAdversaire = 0

@onready var ballon = $Ballon
@onready var joueur = $Player
@onready var adversaire = $Adversaire

@onready var scorePlayer = $ScoreControlPlayer/ScorePlayer
@onready var scoreAdversaire = $ScoreControlAdversaire/ScoreAdversaire
@onready var celebration = $celebrationBut

var ballonStartPosition : Vector2
var joueurStartPosition : Vector2
var adversaireStartPosition : Vector2
var joueurDernierBut = false
var adversaireDernierBut = false	

func _process(_delta):
	if Input.is_action_just_pressed("cheat"):
		$Control/Timer2.stop()
		get_tree().change_scene_to_file("res://fin_de_jeu.tscn")
	
		
	if ballon.position.x < 13.861 or ballon.position.x > 372.277:
		replay_scene()
	elif ballon.position.y <  3.006 or ballon.position.y > 213.427:	
		replay_scene()
		
func _ready():
	butAdversaire = GameController.getButAdversaire()
	butJoueur = GameController.getButJoueur()
	minute = GameController.getMinute()
	sec = GameController.getSec()

	
	scorePlayer.text = str(butAdversaire)
	scoreAdversaire.text = str(butJoueur)
	
	
	if(butAdversaire != 0 || butJoueur != 0):
		celebration.play()
	
	if(butAdversaire == 3 or butJoueur == 3):
		get_tree().change_scene_to_file("res://fin_de_jeu.tscn")
			
	$Control/Timer2.start()
	$Control/Timer.text = str(minute) + ":" + str(sec)
	
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
	
	if sec == startTime - 1 and minute == 0:
		$Control/Timer2.start()
	pass # Replace with function body.

func replay_scene():

	GameController.setButAdversaire(butAdversaire)
	GameController.setButJoueur(butJoueur)
	GameController.setMinute(minute)
	GameController.setSec(sec)
	
	get_tree().reload_current_scene()
	
func _on_but_player_area_entered(_body):
	if not joueurDernierBut:
		butAdversaire += 1
		joueurDernierBut = true
		adversaireDernierBut = false
		replay_scene()


func _on_but_adversaire_area_entered(_body):
	if not adversaireDernierBut:
		butJoueur += 1
		adversaireDernierBut = true
		joueurDernierBut = false
		replay_scene()

		
func _on_but_adversaire_area_exited(_body):
	adversaireDernierBut =  false

func _on_but_player_area_exited(_body):
	joueurDernierBut = false	
