extends Control

@onready var titre = $GridContainer/Titre
var butJoueur = 0
var butAdversaire = 0

func _ready():
	butAdversaire = GameController.getButAdversaire()
	butJoueur = GameController.getButJoueur()
	
	if(butJoueur == 3):
		titre.text = "VICTOIRE !!"
		titre.modulate = Color.WEB_GREEN
	if(butAdversaire == 3):
		titre.text = "PERDU !!"
		titre.modulate = Color.CRIMSON
		titre.rect_position.x = (titre.parent.rect_size.x - titre.rect_size.x) / 2
			
func _on_button_rejouer_pressed():
	get_tree().change_scene_to_file("res://world.tscn")


func _on_button_quitter_pressed():
	get_tree().quit()


func _on_button_pressed():
	get_tree().change_scene_to_file("res://start_menu.tscn")


