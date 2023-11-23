extends CharacterBody2D


@export var speed = 20

@onready var animation = $AnimationPlayer


 
func _physics_process(_delta):
	var player = get_parent().get_node("Player")
	velocity = position.direction_to(player.position) * speed
	move_and_slide()
	
	look_at(player.position)
	
	if player.animation.current_animation == "idle":
		$AnimationPlayer.play("idle")
		
	elif player.animation.current_animation == "run":
		$AnimationPlayer.play("run")
	
	
