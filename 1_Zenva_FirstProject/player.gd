extends CharacterBody2D


var score : int  = 0
var speed : int = 200
var jumpForse :int = 600
var gravity : int = 1200
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var ui = $"../CanvasLayer/UI"
@onready var audio_player = $"../Camera2D/AudioPlayer"




func _physics_process(delta):
	velocity.x = 0
				  # moving inputs
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
				 # gravitation 
	velocity.y += gravity * delta
		# jump input
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y -= jumpForse
	
			   # sprite direction
	if velocity.x != 0: 
		animated_sprite_2d.flip_h = velocity.x < 0 
		if is_on_floor():
			animated_sprite_2d.play("walk")
	elif velocity.x == 0 and is_on_floor():
		animated_sprite_2d.animation = "idle"
	if velocity.y != 0 and !is_on_floor():
		animated_sprite_2d.animation = "jump"
		
	if position.y > 680:
		die()
	move_and_slide()

func die():
	get_tree().reload_current_scene()

func collect_coin(value):
	score += value
	ui.set_score_text(score)
	audio_player.play_coin_sfx()
	
