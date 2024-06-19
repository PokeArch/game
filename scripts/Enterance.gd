extends Area2D

@onready var transition_fx = preload("res://Sound/SceneChangeFX.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name ==  "player":
		MusicPlayer.play_fx(transition_fx,10)
		if Game.current_scene == "GrassLands":
			get_tree().change_scene_to_file("res://scenes/cave.tscn")
		if Game.current_scene == "Cave":
			get_tree().change_scene_to_file("res://scenes/cave2.tscn")
		if Game.current_scene == "InnerCave":
			get_tree().change_scene_to_file("res://scenes/beach.tscn")
