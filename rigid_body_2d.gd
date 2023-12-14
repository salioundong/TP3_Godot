extends RigidBody2D
class_name Ballon
var acceleration: Vector2 = Vector2.ZERO

var ballon_speed = 25.0


func _physics_process(_delta):
	if linear_velocity.length() > 1:
		linear_velocity = linear_velocity * 0.9		
	pass


		
