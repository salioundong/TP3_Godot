extends Control


func _on_button_rejouer_pressed():
	get_tree().change_scene_to_file("res://world.tscn")


func _on_button_quitter_pressed():
	get_tree().quit()


func _on_button_pressed():
	get_tree().change_scene_to_file("res://start_menu.tscn")


