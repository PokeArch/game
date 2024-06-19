extends Node2D

var showPokemon
# Called when the node enters the scene tree for the first time.
func _ready():
	$MewTwo.visible = false
	$Bulbasaur.visible = false
	$Pikachu.visible = false
	$Charmander.visible = false
	$Squirtel.visible = false
	$Hypno.visible = false
	showPokemon = null
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if showPokemon:
		if showPokemon == "Bulbasaur":
			$Bulbasaur.visible = true
		elif showPokemon == "MewTwo":
			$MewTwo.visible = true
		elif showPokemon == "Pikachu":
			$Pikachu.visible = true
		elif showPokemon == "Charmander":
			$Charmander.visible = true
		elif showPokemon == "Squirtle":
			$Squirtel.visible = true
		elif showPokemon == "Hypno":
			$Hypno.visible = true
		else:
			self.visible = false
