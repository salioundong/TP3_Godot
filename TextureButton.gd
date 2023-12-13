extends TextureButton

var music = AudioServer.get_bus_index("Music")



func _on_pressed():
	AudioServer.set_bus_mute(music, not AudioServer.is_bus_mute(music))
