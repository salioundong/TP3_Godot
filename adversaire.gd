extends CharacterBody2D

@export var speed = 20
@export var push_force = 1.0
var shoot_force: float = 200.0 
var shoot_force_multiplier: float = 2.0 
var max_distance_for_shoot: float = 50.0  

@onready var animation = $AnimationPlayer
@onready var tirBut = $tirAdversaire
@onready var ballon = get_parent().get_node("Ballon")
@onready var player = get_parent().get_node("Player")

var direction = Vector2.ZERO

var tir = false
var tir_delai = 3
var tir_temps = 0

func _physics_process(delta):
	# Utilisez la logique AI pour obtenir la direction
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
		if c.get_collider() is RigidBody2D:  # Changement en RigidBody2D
			if tir and global_position.distance_to(c.get_collider().global_position) < max_distance_for_shoot:
				var tir_force = velocity.normalized() * shoot_force * shoot_force_multiplier
				c.get_collider().apply_impulse(tir_force)
				tir = false
			else:
				c.get_collider().apply_impulse(velocity * push_force)
	#move_and_slide()

	# Ajoutez les contrôles AI ici
	update_ai_controls()

	if Input.is_action_just_pressed("tirer"):    
		tir = true
		tirBut.play()

	update_animation()
	if direction != Vector2.ZERO:
		look_at_direction()
				
func get_ai_direction():
	# Logique AI personnalisée pour suivre et contrôler le ballon
	var target_direction = ballon.global_position - global_position
	target_direction = target_direction.normalized()
	return target_direction

func update_ai_controls():
	# Déplacez l'adversaire derrière le ballon en se dirigeant vers les buts du joueur
	#var target_position = ballon.global_position - ballon.linear_velocity.normalized() * 20
	direction = player.global_position - global_position  # Change vers la position du joueur
	direction = direction.normalized()

func update_animation():
	if direction != Vector2.ZERO:
		animation.play("run")
	else:
		animation.play("idle")

func look_at_direction():
	if direction != Vector2.ZERO:
		rotation = direction.angle()
