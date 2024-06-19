extends Area2D

@onready var transition_fx = preload("res://Sound/SceneChangeFX.mp3")


func _ready():
	pass
	

func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "player":
		MusicPlayer.play_fx(transition_fx,10)
		if Game.current_scene == "Cave":
			get_tree().change_scene_to_file("res://scenes/world.tscn")
		if Game.current_scene == "InnerCave":
			get_tree().change_scene_to_file("res://scenes/cave.tscn")
		if Game.current_scene == "Beach":
			get_tree().change_scene_to_file("res://scenes/cave2.tscn")
