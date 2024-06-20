extends Node2D

var enemy_temp
var friendly_temp 
var enemy_health
var friendly_health
var friendly_move = true
var special_move_points = 0 
var friendly_faint = false
var enemy_faint = false
var faintFXplayed = false

@onready var SpecialMoveSoundEffect = preload("res://Sound/beep3-98810.mp3")
@onready var FriendlyHurtSoundEffect = preload("res://Sound/pixel-sound-effect-3-82880.mp3")
@onready var EnemyHurtSoundEffect = preload("res://Sound/arcade-game-retro-8-bit-big-shot-1-smartsound-fx-1-00-00.mp3")
@onready var EnemyFaintSoundEffect = preload("res://Sound/WhatsApp Audio 2024-05-19 at 07.36.01_3918ebac.mp3")
@onready var FriendlyFaintSoundEffect = preload("res://Sound/game-over-arcade-6435.mp3")


@onready var Position = $CanvasLayer/EnemySpawn
@onready var Friendly = $CanvasLayer/FriendlyPokemonSpawn
@onready var enemy_health_bar = $CanvasLayer/enemy_health_bar
@onready var friendly_health_bar = $CanvasLayer/Pokemons_health
@onready var special_move_bar = $CanvasLayer/SpecialMoveBar
@onready var enemy_timer = $EnemyMove

var rng = RandomNumberGenerator.new()

func _ready():
	MusicPlayer.play_battle_music()
	friendly_move = false
	special_move_points = 0
	special_move_bar._init_Health(special_move_points)
	handle_spawn()
	

func handle_spawn():
	enemy_temp = Game.encountered_pokemon.instantiate()
	enemy_health = enemy_temp.health
	enemy_temp.enemy = true
	Position.add_child(enemy_temp)
	enemy_health_bar._init_Health(enemy_health)

	# Instantiate the chosen Pokémon
	if Game.choosen_pokemon != null:
		friendly_temp = Game.choosen_pokemon.instantiate()
		friendly_temp.friendly = true
		friendly_health = Game.player_pokemon[friendly_temp.PokemonName]["health"]
		Friendly.add_child(friendly_temp)
	else:
		print("No chosen Pokémon to instantiate")
	if friendly_temp.PokemonName == "Bulbasaur":
		$CanvasLayer/spl.text = "Wrap"
	elif friendly_temp.PokemonName == "Charmander":
		$CanvasLayer/spl.text = "Fire"
	elif friendly_temp.PokemonName == "Mewtwo":
		$CanvasLayer/spl.text = "Psychic"
	elif friendly_temp.PokemonName == "Pikachu":
		$CanvasLayer/spl.text = "ThunderBolt"
	elif friendly_temp.PokemonName == "Squirtle":
		$CanvasLayer/spl.text = "Aqua Jet"
	elif friendly_temp.PokemonName == "Hypno":
		$CanvasLayer/spl.text = "Hypnosis"

func _process(delta):
	if faintFXplayed == false:
		if enemy_health<=0:
			faintFXplayed = true
			MusicPlayer.play_fx(EnemyFaintSoundEffect)
		if friendly_health<=0:
			faintFXplayed = true
			MusicPlayer.play_fx(FriendlyFaintSoundEffect,20)
	enemy_health_bar._set_Health(enemy_health)
	friendly_health_bar._set_Health(friendly_health)
	special_move_bar._set_Health(special_move_points)
	handleAttacks()
	if enemy_health<=0:
		enemy_timer.stop()
		enemy_faint=true
		$fainted.play("enemy_faint")
		$CanvasLayer/fainted_text.text=enemy_temp.PokemonName+ " fainted..."
	if friendly_health<=0:
		friendly_faint=true
		$fainted.play("friendly_faint")
		$CanvasLayer/fainted_text.text=friendly_temp.PokemonName+ " fainted..."

func handleAttacks():
	if Game.bite:
		friendly_temp.bite = true
	if Game.sword:
		friendly_temp.sword = true
	if Game.spike:
		friendly_temp.spike = true
	if Game.splAttackEnemy:
		friendly_temp.enemySplAttack = enemy_temp.PokemonName

func _on_back_pressed():
	for item in Game.player_pokemon:
		print(item + ":" + str(Game.player_pokemon[item]["health"]))
	Game.encountered_pokemon = null
	Game.player_pokemon[friendly_temp.PokemonName]["health"] = friendly_health
	if Game.current_scene == "GrassLands":
		get_tree().change_scene_to_file("res://scenes/world.tscn")
	if Game.current_scene == "Cave":
		get_tree().change_scene_to_file("res://scenes/cave.tscn")
	if Game.current_scene == "InnerCave":
		get_tree().change_scene_to_file("res://scenes/cave2.tscn")
	if Game.current_scene == "Beach":
		get_tree().change_scene_to_file("res://scenes/beach.tscn")
		
		

func _on_bite_pressed():
	if friendly_move:
		MusicPlayer.play_fx(EnemyHurtSoundEffect)
		enemy_temp.bite = true
		enemy_temp.hitEnemy = true
		enemy_health -= 18
		friendly_move = false
		special_move_points += 30

func _on_sword_pressed():
	if friendly_move:
		MusicPlayer.play_fx(EnemyHurtSoundEffect)
		enemy_temp.sword = true
		enemy_temp.hitEnemy = true
		enemy_health -= 12
		friendly_move = false
		special_move_points += 45

func _on_spike_pressed():
	if friendly_move:
		MusicPlayer.play_fx(EnemyHurtSoundEffect)
		enemy_temp.spike = true
		enemy_temp.hitEnemy = true
		enemy_health -= 15
		friendly_move = false
		special_move_points += 20

func _on_spl_pressed():
	if special_move_points >= 100 and friendly_move:
		MusicPlayer.play_fx(EnemyHurtSoundEffect)
		enemy_temp.spl = friendly_temp.PokemonName
		enemy_temp.hitEnemy = true
		enemy_health -= 25
		friendly_move = false
		special_move_points = 0

func _on_enemy_move_timeout():
	var roll = rng.randf_range(0.0, 1.0)
	MusicPlayer.play_fx(FriendlyHurtSoundEffect,15)
	if roll < 0.2:
		Game.bite = true
		friendly_health -= 5
	elif roll < 0.5:
		Game.sword = true
		friendly_health -= 2
	elif roll < 0.7:
		Game.spike = true
		friendly_health -= 10
	else:
		Game.splAttackEnemy = true
		friendly_health -= 15
		

func _on_friendly_move_timeout():
	if special_move_points >= 100:
		MusicPlayer.play_fx(SpecialMoveSoundEffect,20)
	friendly_move = true

func _on_bag_pressed():
	var exists = false
	var pokemon_keys = Game.player_pokemon.keys()
	for name in pokemon_keys :
		if name == enemy_temp.PokemonName:
			exists = true
			break
	if not exists and enemy_health <= 40 and pokemon_keys.size() < 5:
		enemy_timer.stop()
		$catch.play("catch")
		Game.player_pokemon[friendly_temp.PokemonName]["health"] = friendly_health
		Game.player_pokemon[enemy_temp.PokemonName] = {"health": enemy_health}

func _on_fainted_animation_finished(enemy_faint):
	enemy_faint = true
	Game.player_pokemon[friendly_temp.PokemonName]["health"] = friendly_health
	if Game.current_scene == "GrassLands":
		get_tree().change_scene_to_file("res://scenes/world.tscn")
	if Game.current_scene == "Cave":
		get_tree().change_scene_to_file("res://scenes/cave.tscn")
	if Game.current_scene == "InnerCave":
		get_tree().change_scene_to_file("res://scenes/cave2.tscn")
	if Game.current_scene == "Beach":
		get_tree().change_scene_to_file("res://scenes/beach.tscn")

func _on_battlescene_start_animation_finished(battle_cutscene):
	friendly_move = true
	enemy_timer.start()

func _on_catch_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://scenes/caught_uncaught.tscn")


func _on_friendly_fainted_animation_finished(anim_name):
	if Game.current_scene == "GrassLands":
		get_tree().change_scene_to_file("res://scenes/world.tscn")
	if Game.current_scene == "Cave":
		get_tree().change_scene_to_file("res://scenes/cave.tscn")
	if Game.current_scene == "InnerCave":
		get_tree().change_scene_to_file("res://scenes/cave2.tscn")
	if Game.current_scene == "Beach":
		get_tree().change_scene_to_file("res://scenes/beach.tscn")
	
