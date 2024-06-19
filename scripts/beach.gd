extends Node2D

var scene_name = "Beach"
@onready var Player = $player 
# Called when the node enters the scene tree for the first time.
func _ready():
	if Game.player_position and Game.current_scene == scene_name:
		Player.position = Game.player_position
	if Game.current_scene == "InnerCave" and Player:
		Player.position = Vector2(1304,936)
		Game.current_scene = scene_name
		
func _process(delta):
	if Player:
		Game.player_position = Player.position
