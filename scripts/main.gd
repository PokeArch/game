extends Control

@onready var RegisterScreen = $VBoxContainer/register
@onready var LoginScreen = $VBoxContainer/choose_archid
# Called when the node enters the scene tree for the first time.
func _ready():
	MusicPlayer.play_menu_music()
	$VBoxContainer/Register.grab_focus()
	RegisterScreen.visible = false
	LoginScreen.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_instructions_pressed():
	get_tree().change_scene_to_file("res://scenes/instructions.tscn")

func _on_quit_pressed():
	get_tree().quit()


func _on_logic_pressed():
	#get_tree().change_scene_to_file("res://scenes/login.tscn")
	var tween = create_tween()
	if RegisterScreen.visible == true:
		tween.tween_property(RegisterScreen,"visible",false,0.3)
	tween.tween_property(LoginScreen,"visible",true,0.3)


func _on_register_pressed():
	var tween = create_tween()
	if LoginScreen.visible == true:
		tween.tween_property(LoginScreen,"visible",false,0.3)
	tween.tween_property(RegisterScreen,"visible",true,0.3)
	#get_tree().change_scene_to_file("res://scenes/register.tscn")
