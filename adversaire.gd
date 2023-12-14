extends CharacterBody2D

@export var speed = 20
@export var push_force = 1.0
var shoot_force: float = 200.0 
var shoot_force_multiplier: float = 2.0 
var max_distance_for_shoot: float = 50.0
  
@onready var butplayer = $"../ButPlayer"
@onready var animation = $AnimationPlayer
@onready var tirBut = $tirAdversaire
@onready var ballon = get_parent().get_node("Ballon")
@onready var player = get_parent().get_node("Player")

var direction = Vector2.ZERO

var tir = false
var tir_delai = 3
var tir_temps = 0

func _physics_process(delta):
	var ai_direction = get_ai_direction()
	direction = ai_direction
	velocity = direction * speed

	if tir:
		tir_temps += delta
		if tir_temps >= tir_delai:
			tir = false
			tir_temps = 0

	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if is_instance_valid(c.get_collider()) and c.get_collider() is RigidBody2D:
			if tir and global_position.distance_to(c.get_collider().global_position) < max_distance_for_shoot:
				var tir_force = velocity.normalized() * shoot_force * shoot_force_multiplier
				c.get_collider().apply_impulse(tir_force)
				tir = false
			else:
				c.get_collider().apply_impulse(velocity * push_force)

	update_ai_controls()

	if Input.is_action_just_pressed("tirer"):    
		tir = true
		tirBut.play()

	update_animation()
	if direction != Vector2.ZERO:
		look_at_direction()

	# Utilisation de move_and_slide() avec un dictionnaire d'options
	move_and_collide(velocity)

func get_ai_direction():
	return (ballon.global_position - global_position).normalized()

func update_ai_controls():
	direction = (butplayer.global_position - global_position).normalized()

func update_animation():
	if direction != Vector2.ZERO:
		animation.play("run")
	else:
		animation.play("idle")

func look_at_direction():
	if direction != Vector2.ZERO:
		rotation = direction.angle()

