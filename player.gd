extends CharacterBody2D


@export var speed = 30
@export var acceleration = 0.1
@export var friction = 0.05

func _ready():
	pass
	

func _physics_process(delta):
	var direction = Vector2()
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	direction = direction.normalized()
	
	if(direction.length() > 0):
		velocity = velocity.lerp( direction * speed, acceleration)
	else :
		velocity = velocity.lerp( Vector2.ZERO, friction)


	move_and_slide()
