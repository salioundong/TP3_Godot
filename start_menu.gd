extends Control
@onready var menu = $MarginContainer/Menu
@onready var options = $Options
@onready var video = $Video
@onready var audio = $Audio

# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/Menu/StartButton.grab_focus()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		toogle()
	pass

func toogle():
	visible = !visible
	get_tree().paused = visible

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://world.tscn")


func _on_quick_options_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_settings_button_pressed():
	show_and_hide(options, menu)
	
func show_and_hide(first, second):
	first.show()
	second.hide()	

func _on_video_pressed():
	show_and_hide(video, options)


func _on_audio_pressed():
	show_and_hide(audio, options)


func _on_back_option_pressed():
	show_and_hide(menu, options)

func _on_full_screen_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_back_video_pressed():
	show_and_hide(options, video)


func _on_master_value_changed(value):
	volume(0, value)
	
func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, value)	


func _on_back_audio_pressed():
	show_and_hide(options, audio)
