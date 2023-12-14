extends CharacterBody2D

@export var speed = 25
@export var push_force = 1.0
var shoot_force: float = 150.0 
var shoot_force_multiplier: float = 2.0 
var max_distance_for_shoot: float = 35.0  

@onready var animation = $AnimationPlayer
@onready var tirBut = $tirAdversaire
@onready var ballon = $"../Ballon"
@onready var butPlayer = $"../ButPlayer"

var tir = false
var tir_delai = 3
var tir_temps = 0

func _physics_process(delta):
	#update_movement(delta)
	check_shoot_conditions(delta)

func update_movement(delta):
	var direction_to_ballon = (ballon.global_position - global_position).normalized()
	velocity = direction_to_ballon * speed
	global_position += velocity * delta

	update_animation(direction_to_ballon)

func update_animation(direction):
	if direction != Vector2.ZERO:
		animation.play("run")
		look_at_direction(direction)
	else:
		animation.play("idle")

func look_at_direction(direction):
	if direction != Vector2.ZERO:
		rotation = direction.angle()

func check_shoot_conditions(delta):
	var distance_to_ballon = global_position.distance_to(ballon.global_position)

	if !tir and distance_to_ballon < max_distance_for_shoot:
		tir = true

	if tir:
		tir_temps += delta
		if tir_temps >= tir_delai:
			shoot()
			tir_temps = 0

func shoot():
	tirBut.play()
	var tir_force = (butPlayer.global_position - global_position).normalized() * shoot_force * shoot_force_multiplier
	ballon.apply_impulse(tir_force)
	tir = false
