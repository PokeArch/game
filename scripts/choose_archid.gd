extends Node2D

var name_callback = JavaScriptBridge.create_callback(render)

func _ready():
	Game.externalator.addGodotFunction('renderName',name_callback)
	await JavaScriptBridge.eval("window.getNames()")

func render(arch_id):
	var vbox_container = $VBoxContainer
	var button = Button.new()
	button.text = arch_id[0]
	button.name = arch_id[0] 
	vbox_container.add_child(button) 
	button.pressed.connect(_on_button_pressed.bind(button))


func _process(delta):
	if Input.is_action_pressed("Quit"):
		var tween = create_tween()
		tween.tween_property( self , "visible" , false , 0.3)

func _on_button_pressed(button):
	await JavaScriptBridge.eval("window.register('" + button.name + "')")
	Game.selected_arch_id = button.name
	print("Selected Arch ID: " + Game.selected_arch_id)


func _on_back_pressed():
	var tween = create_tween()
	tween.tween_property( self , "visible" , false , 0.3)
	#get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_continue_pressed():
	get_tree().change_scene_to_file("res://scenes/lab.tscn")
