extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Back.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
