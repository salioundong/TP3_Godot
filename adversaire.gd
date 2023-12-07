extends CharacterBody2D

@export var speed = 20
@export var push_force = 1.0
var SHOOT_FORCE: float = 500.0 
var SHOOT_FORCE_MULTIPLIER: float = 2.0
var MAX_DISTANCE_FOR_SHOOT: float = 50.0

@onready var animation = $AnimationPlayer
@onready var ballon = get_parent().get_node("Ballon")
@onready var player = get_parent().get_node("Player")

var direction = Vector2.ZERO
var tir = false
var tir_delai = 5
var tir_temps = 0

func _physics_process(delta):
	direction = get_ai_direction()
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
			if tir and global_position.distance_to(c.get_collider().global_position) < MAX_DISTANCE_FOR_SHOOT:
				var tir_force = velocity.normalized() * SHOOT_FORCE * SHOOT_FORCE_MULTIPLIER
				c.get_collider().apply_impulse(tir_force)
				tir = false
			else:	
				c.get_collider().apply_impulse(velocity * push_force)
	#move_and_slide()
	
	update_animation()
	if direction != Vector2.ZERO:
		look_at_direction()

func get_ai_direction():
	# Calculer la direction pour que l'adversaire suive le ballon
	var target_direction = ballon.global_position - global_position
	target_direction = target_direction.normalized()
	return target_direction

func update_animation():
	if direction != Vector2.ZERO:
		animation.play("run")
	else:
		animation.play("idle")

func look_at_direction():
	if direction != Vector2.ZERO:
		rotation = direction.angle()
