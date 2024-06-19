extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if self.visible == true:
		$LineEdit.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Quit"):
		var tween = create_tween()
		tween.tween_property( self , "visible" , false , 0.3)
		


func _on_line_edit_text_submitted(new_text):
	Game.arch_ids.append(String(new_text))


func _on_continue_pressed():
	get_tree().change_scene_to_file("res://scenes/lab.tscn")


func _on_back_pressed():
	var tween = create_tween()
	tween.tween_property( self , "visible" , false , 0.3)
