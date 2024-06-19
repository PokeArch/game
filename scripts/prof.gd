extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var has_spoken = false
var in_range= false

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#
#
#func _physics_process(delta):
	## Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()

const lines:Array[String]=[
	"Ah, welcome, Ash! I've been expecting you.",
	"I remember when I began my own journey. It was a thrilling adventure.",
	"Now, let's get you started.",
	"Here is your new partner, Pikachu!",
	"Now before you leave i have a few instructions...",
	"Press 'I' to open the inventory.",
	" Press 'B' to collect berries, these heal Pokemons...",
	"Battle Pokemons and catch them when their health is low...",
	"Now, go out there and start your journey!"
]
const spoken:Array[String]=[
	"Catch 'em all!" 
]

func _unhandled_input(event):
	if has_spoken==false:
		if event.is_action_pressed("Interact"):
			if in_range:
				has_spoken=true
				DialogManager.start_dialog(global_position, lines)
	if has_spoken:
		if event.is_action_pressed("Interact"):
			if in_range:
				DialogManager.start_dialog(global_position, spoken)
		



func _on_area_2d_body_entered(body):
	if body.name=="player":
		in_range=true



func _on_area_2d_body_exited(body):
	if body.name=="player":
		in_range=false


func _on_area_2d_2_body_entered(body):
	if body.name=="player" && has_spoken==true:
		get_tree().change_scene_to_file("res://scenes/world.tscn")
