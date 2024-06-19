extends Area2D

var in_range=false
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Game.battled_cave == false:
		trigger()



func trigger():
	if 	Game.battled_cave == false && in_range== true:
		Game.battled_cave=true
		trigger_encounter()
#
#func _process(delta):
	#if player_in_grass and rng.randf() < rand * delta:
		#trigger_encounter()

func trigger_encounter():
	var keys = Game.pokemon_list.keys()
	var random_key = keys[rng.randi_range(4, keys.size() - 2)]
	var random_pokemon = Game.pokemon_list[random_key]
	Game.encountered_pokemon = random_pokemon
	get_tree().change_scene_to_file("res://scenes/transition.tscn")


func _on_body_entered(body):
	if body.name=="player":
		in_range=true


func _on_body_exited(body):
	if body.name=="player":
		in_range=false
