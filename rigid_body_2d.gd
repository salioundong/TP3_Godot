extends RigidBody2D
class_name Ballon
var acceleration: Vector2 = Vector2.ZERO

var ballon_speed = 30.0



func _physics_process(_delta):
	if linear_velocity.length() > 0.1:
		linear_velocity = linear_velocity * 0.9
		
	pass


#func apply_force(force):
#	acceleration += force


		
