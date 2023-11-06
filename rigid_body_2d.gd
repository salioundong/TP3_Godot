extends RigidBody2D
class_name Ballon

var player = null : set = set_player

func set_player(value):
	if player:
		remove_collision_exception_with(player)
	player = value
	if player:
		add_collision_exception_with(player)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player:
		global_position = player.global_position + Vector2(6,0)


func _on_body_entered(body):
	if body.is_in_group("Player"):
		print("collision")
