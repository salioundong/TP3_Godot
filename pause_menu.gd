extends Control


var _paused:bool = false:
	set(value):
		_paused = value
		get_tree().paused = _paused
		visible = _paused

func _unhandled_input(event: InputEvent) ->void:
	if event.is_action_pressed("pause"):
		_paused = !_paused
	


func _on_button_reprise_pressed():
	_paused = false


func _on_button_options_pressed():
	pass # Replace with function body.


func _on_button_quit_pressed():
	get_tree().quit()
