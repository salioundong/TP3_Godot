extends Control

var _is_paused:bool = false:
	set = set_paused
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		_is_paused = !_is_paused
	
	
func set_paused(value:bool) ->void:
	_is_paused = value
	get_tree().paused = _is_paused
	visible = _is_paused	

func _on_button_reprise_pressed():
	_is_paused = false


func _on_button_options_pressed():
	pass # Replace with function body.


func _on_button_quit_pressed():
	get_tree().quit()
