extends Node2D

@onready var Player = $player
@onready var Music = $AudioStreamPlayer
var scene_name = "GrassLands"


func _ready():
	MusicPlayer.play_level_music()
	
	if Game.player_position and Game.current_scene == scene_name:
		Player.position = Game.player_position
	if Game.current_scene != scene_name and Player:
		Player.position = Vector2(985,712)
		Game.current_scene = scene_name
		
func _process(delta):
	if Player:
		Game.player_position = Player.position
