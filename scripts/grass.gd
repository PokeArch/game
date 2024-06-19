extends Area2D

const rand = 0.5
var player_in_grass = false
var rng = RandomNumberGenerator.new()
var interacted


func _ready():
	pass

func _on_body_entered(body):
	if body.name == "player" and interacted == false:
		player_in_grass = true

func _on_body_exited(body):
	if body.name == "player":
		player_in_grass = false
		interacted = false

func _process(delta):
	if player_in_grass and rng.randf() < rand * delta:
		trigger_encounter()

func trigger_encounter():
	var keys = Game.pokemon_list.keys()
	var random_key = keys[rng.randi_range(0, keys.size() - 2)]
	var random_pokemon = Game.pokemon_list[random_key]
	Game.encountered_pokemon = random_pokemon
	interacted = true
	get_tree().change_scene_to_file("res://scenes/transition.tscn")
