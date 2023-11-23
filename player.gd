extends CharacterBody2D

@export var speed = 20
@export var acceleration = 0.1
@export var friction = 0.05

@export var BALL_FORCE = 200.0
var SHOOT_FORCE: float = 500.0 

@onready var animation = $AnimationPlayer

var direction = Vector2.ZERO
var is_colliding_with_ballon = false
@onready var ballon = $"../Ballon"

func _physics_process(_delta):
	var input_direction = get_input_direction()
	
	update_movement(input_direction)
	shoot_ballon(_delta)
	update_animation(input_direction)
	
	#f Input.is_action_just_pressed("tirer"):
	
	
func shoot_ballon(_delta):
	var input_direction = get_input_direction()
	velocity.x = input_direction.x * speed
	velocity.y = input_direction.y * speed
	

	
	var collision = move_and_collide(velocity * _delta)
	if collision:
		ballon.player = null
		print("tir")
		ballon.apply_impulse(collision.get_normal() * -SHOOT_FORCE)
		
func _on_collision_entered(body):
	if body.name == "Ballon":
		is_colliding_with_ballon = true
		ballon = body
		
func _on_collision_exited(body):
	if body.name == "Ballon":
		is_colliding_with_ballon = false
		#ballon = null

func get_input_direction():
	var direction = Vector2()
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return direction.normalized()

func update_movement(direction):
	velocity = direction * speed
	for colidx in get_slide_collision_count():
		var col = get_slide_collision(colidx).get_collider()
		if col is Ballon:
			col.player = self
			

	#move_and_slide()
	if direction != Vector2.ZERO:
		look_at_direction(direction)

func look_at_direction(direction):
	if direction != Vector2.ZERO:
		rotation = direction.angle()

func update_animation(direction):
	if direction != Vector2.ZERO:
		animation.play("run")
	else:
		animation.play("idle")

func control_ballon(input_direction):
	if ballon:
		print("Ballon")
		var force = BALL_FORCE * input_direction
		ballon.apply_impulse(Vector2.ZERO, force)
	else:
		update_movement(input_direction)
		update_animation(input_direction)



