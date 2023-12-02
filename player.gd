extends CharacterBody2D

@export var speed = 20
@export var push_force = 1.0
var SHOOT_FORCE: float = 500.0 

@onready var animation = $AnimationPlayer



var direction = Vector2.ZERO

var tir = false
var tir_delai = 0.1
var tir_temps = 0

func _physics_process(delta):
	var input_direction = get_input_direction()

	direction = input_direction
	velocity = direction * speed
	if tir:
		tir_temps += delta
		if tir_temps >= tir_delai:
			tir = false
			tir_temps = 0
			
	# Gérer la collision avec le Ballon
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is Ballon:
			#si bouton appuyé pendant le delai, duplique push force
			if Input.is_action_pressed("tirer"):
				tir = true
			if tir:
				print('space')
				var tir_force = velocity.normalized() * push_force * 2.0
				c.get_collider().apply_impulse(tir_force)
				tir = false
			else:	
				c.get_collider().apply_impulse(velocity * push_force)
				print(velocity)
	move_and_slide()
		
	update_animation()
	if direction != Vector2.ZERO:
		look_at_direction()
				

func get_input_direction():
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return direction.normalized()

func update_animation():
	if direction != Vector2.ZERO:
		animation.play("run")
	else:
		animation.play("idle")


func look_at_direction():
	if direction != Vector2.ZERO:
		rotation = direction.angle()
