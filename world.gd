extends Node2D

var startTime = 1
var sec = startTime
var minute = 1
		

func _process(_delta):
	pass	

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
