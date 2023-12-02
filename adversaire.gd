extends CharacterBody2D
#
#
#@export var speed = 20
#
#@onready var animation = $AnimationPlayer
#@onready var adversaire = $Adversaire
#
#@onready var ballon = get_parent().get_node("Ballon")
#@onready var player = get_parent().get_node("Player")
#
##func _ready():
##		look_at(ballon.position)
#
#func _physics_process(_delta):
#	adversaire.flip_h = true
#	velocity = position.direction_to(ballon.position) * speed
#	move_and_slide()
#
#	#look_at(ballon.position)
#
#	if player.animation.current_animation == "idle":
#		$AnimationPlayer.play("idle")
#
#	elif player.animation.current_animation == "run":
#		$AnimationPlayer.play("run")
#
