extends Node2D


func _ready():
	var vbox_container = $VBoxContainer
	
	# Loop through all arch_ids and create buttons
	for arch_id in Game.arch_ids:
		var button = Button.new()
		button.text = arch_id
		button.name = arch_id 
		vbox_container.add_child(button) 
		button.pressed.connect(_on_button_pressed.bind(button))


func _process(delta):
	if Input.is_action_pressed("Quit"):
		var tween = create_tween()
		tween.tween_property( self , "visible" , false , 0.3)

func _on_button_pressed(button):
	Game.selected_arch_id = button.name
	print("Selected Arch ID: " + Game.selected_arch_id)


func _on_back_pressed():
	var tween = create_tween()
	tween.tween_property( self , "visible" , false , 0.3)
	#get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_continue_pressed():
	get_tree().change_scene_to_file("res://scenes/lab.tscn")
