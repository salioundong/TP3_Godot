extends RigidBody2D
class_name Ballon

var player = null : set = set_player
var ballon_speed = 30.0

func set_player(value):
	if player:
		remove_collision_exception_with(player)
	player = value
	if player:
		add_collision_exception_with(player)

func _physics_process(_delta):
	if player:
		# Obtenir la direction entre le joueur et le ballon
		global_position = player.global_position + player.direction * Vector2(6,8)

		


		
