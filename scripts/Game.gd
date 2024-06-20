extends Node

var save_path =  "://savedFile"
var Bulbasaur  = preload("res://scenes/battle_bulbasaur.tscn")
var Mewtwo  = preload("res://scenes/battle_mewtwo.tscn")
var Charmander  = preload("res://scenes/battle_charmander.tscn")
var Pikachu  = preload("res://scenes/battle_pikachu.tscn")
var Squirtle = preload("res://scenes/battle_squirtel.tscn")
var Hypno = preload("res://scenes/battle_hypno.tscn")

var externalator = JavaScriptBridge.get_interface("externalator")
var register_callback = JavaScriptBridge.create_callback(_on_register_finished)
var add_pokemon_callback = JavaScriptBridge.create_callback(add_pokemon)
var battle_callback = JavaScriptBridge.create_callback(challenge_player)

var battled_cave = false
var player_id
var player_pokemon = {"Bulbasaur" : {"health"  : 100, "index": 0}}
var player_potions = 0
var player_berries = 0
var player_position = Vector2()
var player_default_pokemon 

var current_scene = "GrassLands"

var arch_ids=[]
var selected_arch_id=""

var ArchIdForTrade
var ArchIdForChallenge

var encountered_pokemon = null
var choosen_pokemon = null  
var chosen_index = null
var pokemon_added = false

var pokemon_list = {"Bulbasaur": Bulbasaur, "Charmander": Charmander, "Squirtle" : Squirtle, "Hypno" : Hypno, "Mewtwo": Mewtwo , "Pikachu": Pikachu}

var bite
var sword
var spike 
var splAttackEnemy

func _ready():
	Game.externalator.addGodotFunction('register',register_callback)
	Game.externalator.addGodotFunction('addPokemon', add_pokemon_callback)
	Game.externalator.addGodotFunction('startBattle', battle_callback)
	
	
func process():
	pass

func add_pokemon(pokemon):
	pokemon_added = true
	player_pokemon[pokemon[0]] = {"health": pokemon[1], "index": pokemon[2]}  

func challenge_player(key):
	var enemy_poke = pokemon_list[key[0]]
	encountered_pokemon = enemy_poke
	get_tree().change_scene_to_file("res://scenes/transition.tscn")

func update_potions(amount):
	player_potions += amount

func update_berries(amount):
	player_berries += amount

func update_player_position(position):
	player_position = position

func _on_register_finished(cond):
	if cond[0] == "true":
		get_tree().change_scene_to_file("res://scenes/lab.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/world.tscn")

func save_game():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(player_id)
	file.store_var(player_pokemon)
	file.store_var(player_potions)
	file.store_var(player_berries)
	file.store_var(player_position)

func load_game():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		player_id = file.get_var()
		player_pokemon = file.get_var()
		player_potions = file.get_var()
		player_berries = file.get_var()
		player_position = file.get_var()
	else:
		print("No Data Saved")

func choose_pokemon(name: String):
	if name in pokemon_list:
		choosen_pokemon = pokemon_list[name]
	else:
		print("Pokemon not found")


var previous_pokemon = ""

func some_function_where_pokemon_is_chosen():
	var keys = player_pokemon.keys()
	var available_keys = []

	for key in keys:
		if key != previous_pokemon:
			available_keys.append(key)

	if available_keys.size() > 0:
		var random_index = randi_range(0, available_keys.size() - 1)
		var random_pokemon_name = available_keys[random_index]
		choose_pokemon(random_pokemon_name)
		previous_pokemon = random_pokemon_name
	else:
		print("No more available Pokémon to choose from")
