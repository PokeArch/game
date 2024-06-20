extends Node2D

var caughtSuccessful
var pokemon_temp
var rng = RandomNumberGenerator.new()
var randomNum = rng.randi_range(1,200)

@onready var Drumroll = preload("res://Sound/tadaa-47995.mp3")
@onready var Pokeball = $CanvasLayer/Pokeball
@onready var Effects = $CanvasLayer/Effects
@onready var Pokemon = $CanvasLayer/Pokemon
@onready var timer = $Timer
@onready var sceneChange = $CanvasLayer/SceneChange
@onready var textBackground = $CanvasLayer/TextBackground
@onready var label = $CanvasLayer/TextBackground/Text

var caught_callback = JavaScriptBridge.create_callback(caught)

# Called when the node enters the scene tree for the first time.
func _ready():
	Game.externalator.addGodotFunction('caught',caught_callback)
	textBackground.visible = false
	label.text = ""
	Effects.visible = false
	Pokeball.play("MovingPokeball")
	timer.start()
	MusicPlayer.play_fx(Drumroll)
	
		
func _process(delta):
	pass

func handle_Catching():
	if randomNum % 2 == 0:
		caughtSuccessful = true
	else:
		caughtSuccessful = false
	if caughtSuccessful:
		var script = "window.catch('%s', '%s', '%s', '%s')" % [
			Game.selected_arch_id,
			Game.encountered_pokemon.get_state().get_node_name(0).split("_")[1],
			"100",
			str(Game.chosen_index)
		]
		await JavaScriptBridge.eval(script)
		Pokeball.play("StoppedPokeball")
		var tween = create_tween()
		tween.tween_property($CanvasLayer/TextBackground,"visible",true,0.5)
		label.text = "Pokemon Caught Successfully"
		sceneChange.start()
	else:
		Effects.visible = true
		Effects.play("default")
		var tween = create_tween()
		tween.tween_property($CanvasLayer/TextBackground,"visible",true,0.5)
		label.text = "Couldnt Catch"
		Pokeball.stop()
		pokemon_temp = Game.encountered_pokemon.instantiate()
		Game.player_pokemon.erase(pokemon_temp.PokemonName)
		sceneChange.start()
		

func caught():
	Pokeball.play("StoppedPokeball")
	var tween = create_tween()
	tween.tween_property($CanvasLayer/TextBackground,"visible",true,0.5)
	label.text = "Pokemon Caught Successfully"
	sceneChange.start()

func _on_timer_timeout():
	handle_Catching()


func _on_scene_change_timeout():
	if Game.current_scene == "GrassLands":
		get_tree().change_scene_to_file("res://scenes/world.tscn")
	if Game.current_scene == "Cave":
		get_tree().change_scene_to_file("res://scenes/cave.tscn")
	if Game.current_scene == "InnerCave":
		get_tree().change_scene_to_file("res://scenes/cave2.tscn")
	if Game.current_scene == "Beach":
		get_tree().change_scene_to_file("res://scenes/beach.tscn")


func _on_effects_animation_finished():
	Effects.visible = false
	if Game.current_scene == "GrassLands":
		get_tree().change_scene_to_file("res://scenes/world.tscn")
	if Game.current_scene == "Cave":
		get_tree().change_scene_to_file("res://scenes/cave.tscn")
	if Game.current_scene == "InnerCave":
		get_tree().change_scene_to_file("res://scenes/cave2.tscn")
	if Game.current_scene == "Beach":
		get_tree().change_scene_to_file("res://scenes/beach.tscn")
