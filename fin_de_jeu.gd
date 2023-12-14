extends Control

@onready var titre = $GridContainer/Titre
var butJoueur = 0
var butAdversaire = 0

func _ready():
	butAdversaire = GameController.getButAdversaire()
	butJoueur = GameController.getButJoueur()
		
func _process(_delta):
	if butAdversaire == 3:
		titre.text = "PERDU !!"
		titre.modulate = Color.DARK_RED
	elif butJoueur == 3:
		titre.text = "VICTOIRE !!"
		titre.modulate = Color.DARK_GREEN
	pass
			
func _on_button_rejouer_pressed():
	get_tree().change_scene_to_file("res://world.tscn")

func _on_button_quitter_pressed():
	get_tree().quit()

func _on_button_menu_principal_pressed():
	get_tree().change_scene_to_file("res://start_menu.tscn")
