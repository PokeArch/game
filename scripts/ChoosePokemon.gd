extends Node2D

@onready var FirstPosition = $CanvasLayer/FirstPosition
@onready var FirstPositionHealthbar = $CanvasLayer/FirstPosition/HealthBar
@onready var FirstPositionPokemons = $CanvasLayer/FirstPosition/Pokemons
@onready var FirstPositionButton = $CanvasLayer/FirstPosition/FirstButton


@onready var SecondPosition = $CanvasLayer/SecondPosition
@onready var SecondPositionHealthbar = $CanvasLayer/SecondPosition/HealthBar
@onready var SecondPositionPokemons = $CanvasLayer/SecondPosition/Pokemons
@onready var SecondPositionButton = $CanvasLayer/SecondPosition/SecondButton


@onready var ThirdPosition = $CanvasLayer/ThirdPosition
@onready var ThirdPositionHealthbar = $CanvasLayer/ThirdPosition/HealthBar
@onready var ThirdPositionPokemons = $CanvasLayer/ThirdPosition/Pokemons
@onready var ThirdPositionButton = $CanvasLayer/ThirdPosition/ThirdButton


@onready var FourthPosition = $CanvasLayer/FourthPosition
@onready var FourthPositionHealthbar = $CanvasLayer/FourthPosition/HealthBar
@onready var FourthPositionPokemons = $CanvasLayer/FourthPosition/Pokemons
@onready var FourthPositionButton = $CanvasLayer/FourthPosition/FourthButton

@onready var FifthPosition = $CanvasLayer/FifthPosition
@onready var FifthPositionHealthbar = $CanvasLayer/FifthPosition/HealthBar
@onready var FifthPositionPokemons = $CanvasLayer/FifthPosition/Pokemons
@onready var FifthPositionButton = $CanvasLayer/FifthPosition/FifthButton

var pokemon_keys
var EnemyPokemon = Game.encountered_pokemon.instantiate()
@onready var EnemyPositionPokemon = $CanvasLayer/EncounteredPokemon/Pokemons




func _ready():
	FirstPosition.visible = false
	SecondPosition.visible = false
	ThirdPosition.visible = false
	FourthPosition.visible = false
	FifthPosition.visible = false
	EnemyPositionPokemon.showPokemon = EnemyPokemon.PokemonName
	handlePokemons()
	handleInfo()


func _process(delta):
	pass

func handlePokemons():
	pokemon_keys = Game.player_pokemon.keys()
	if pokemon_keys:
		if pokemon_keys.size() == 1:
			FirstPosition.visible = true	
		elif pokemon_keys.size() == 2:
			FirstPosition.visible = true
			SecondPosition.visible = true	
		elif pokemon_keys.size() == 3:
			FirstPosition.visible = true
			SecondPosition.visible = true
			ThirdPosition.visible = true
		elif pokemon_keys.size() == 4:
			FirstPosition.visible = true
			SecondPosition.visible = true
			ThirdPosition.visible = true
			FourthPosition.visible = true
		elif pokemon_keys.size() == 5:
			FirstPosition.visible = true
			SecondPosition.visible = true
			ThirdPosition.visible = true
			FourthPosition.visible = true
			FifthPosition.visible = true
			
			
func handleInfo():
	if FirstPosition.visible == true:
		FirstPositionButton.text = pokemon_keys[0]
		FirstPositionPokemons.showPokemon = pokemon_keys[0]
		FirstPositionHealthbar._set_Health(Game.player_pokemon[pokemon_keys[0]]["health"])
	if SecondPosition.visible == true:
		SecondPositionButton.text = pokemon_keys[1]
		SecondPositionPokemons.showPokemon = pokemon_keys[1]
		SecondPositionHealthbar._set_Health(Game.player_pokemon[pokemon_keys[1]]["health"])
	if ThirdPosition.visible == true:
		ThirdPositionButton.text = pokemon_keys[2]
		ThirdPositionPokemons.showPokemon = pokemon_keys[2]
		ThirdPositionHealthbar._set_Health(Game.player_pokemon[pokemon_keys[2]]["health"])
	if FourthPosition.visible == true:
		FourthPositionButton.text = pokemon_keys[3]
		FourthPositionPokemons.showPokemon = pokemon_keys[3]
		FourthPositionHealthbar._set_Health(Game.player_pokemon[pokemon_keys[3]]["health"])
	if FifthPosition.visible == true:
		FifthPositionButton.text = pokemon_keys[4]
		FifthPositionPokemons.showPokemon = pokemon_keys[4]
		FifthPositionHealthbar._set_Health(Game.player_pokemon[pokemon_keys[4]]["health"])
		
		
		


func _on_first_button_pressed():
	if not Game.player_pokemon[pokemon_keys[0]]["health"] <= 0:
		Game.choose_pokemon(pokemon_keys[0])
		get_tree().change_scene_to_file("res://scenes/battle_scene.tscn")


func _on_second_button_pressed():
	if not Game.player_pokemon[pokemon_keys[1]]["health"] <= 0:
		Game.choose_pokemon(pokemon_keys[1])
		get_tree().change_scene_to_file("res://scenes/battle_scene.tscn")


func _on_third_button_pressed():
	if not Game.player_pokemon[pokemon_keys[2]]["health"] <= 0:
		Game.choose_pokemon(pokemon_keys[2])
		get_tree().change_scene_to_file("res://scenes/battle_scene.tscn")


func _on_fourth_button_pressed():
	if not Game.player_pokemon[pokemon_keys[3]]["health"] <= 0:
		Game.choose_pokemon(pokemon_keys[3])
		get_tree().change_scene_to_file("res://scenes/battle_scene.tscn")


func _on_fifth_button_pressed():
	if not Game.player_pokemon[pokemon_keys[4]]["health"] <= 0:
		Game.choose_pokemon(pokemon_keys[4])
		get_tree().change_scene_to_file("res://scenes/battle_scene.tscn")
