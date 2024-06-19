extends CharacterBody2D


const SPEED = 300.0
var current_dir="none"

func _ready():
	
	$AnimatedSprite2D.play("idlefront")

func _physics_process(delta):
	player_movemoent(delta)

func player_movemoent(delta):
	if Input.is_action_pressed("Right"):
		current_dir="right"
		play_anim(1)
		velocity.x= SPEED
		velocity.y=0
	elif Input.is_action_pressed("Left"):
		current_dir="left"
		play_anim(1)
		velocity.x= -SPEED
		velocity.y=0
	elif Input.is_action_pressed("Up"):
		current_dir="up"
		play_anim(1)
		velocity.x= 0
		velocity.y=-SPEED
	elif Input.is_action_pressed("Down"):
		current_dir="down"
		play_anim(1)
		velocity.x= 0
		velocity.y=SPEED
	else:
		play_anim(0)
		velocity.x= 0
		velocity.y=0
	move_and_slide()

func play_anim(movement):
	var dir =current_dir
	var anim= $AnimatedSprite2D
	if dir=="right":
		if movement==1:
			anim.play("runright")
		elif movement==0:
			anim.play("idleright")
	if dir=="left":
		if movement==1:
			anim.play("runleft")
		elif movement==0:
			anim.play("idleleft")
	if dir=="up":
		if movement==1:
			anim.play("runback")
		elif movement==0:
			anim.play("idleback")
	if dir=="down":
		if movement==1:
			anim.play("runfront")
		elif movement==0:
			anim.play("idlefront")






func _on_cave_exit_body_entered(body):
	pass # Replace with function body.
