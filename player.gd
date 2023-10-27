extends CharacterBody2D

@export var speed = 50
@export var acceleration = 0.1
@export var friction = 0.05

@onready var animation = $AnimationPlayer

func _ready():
	pass

func _physics_process(_delta):
	var input_direction = get_input_direction()
	update_movement(input_direction)
	update_animation(input_direction)

func get_input_direction():
	var direction = Vector2()
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return direction.normalized()

func update_movement(direction):
	velocity = direction * speed
	move_and_slide()

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
