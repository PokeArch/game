extends Label

var showPokemon

var Pikachu = "Name : Pikachu
Special Attack : Thunderbolt
Type: Electric

Description: Pikachu is a small, yellow, mouse-like Pokémon known for its ability to generate electricity. 
"

var MewTwo = "Name : MewTwo
Special Attack : Jaadu
Type: Psychic

Description: Mewtwo is a legendary Pokémon created through genetic manipulation. It is known for its immense psychic power . "

var Bulbasuar = "Name : Bulbasaur
Special Attack : Tail Whip
Type: Grass/Poison

Description: Bulbasaur is a small, quadruped Pokémon with a plant bulb on its back. As it evolves, the bulb blossoms into a large flower."

var Charmander = "Name : Charmander
Special Attack : Fire
Type: Fire

Description: Charmander is a dinosaur-like Pokémon with a flame on the tip of its tail. The flame's size indicates Charmander's health."


# Called when the node enters the scene tree for the first time.
func _ready():
	if showPokemon:
		if showPokemon == "Bulbasuar":
			self.text = Bulbasuar
		elif showPokemon == "Charmander":
			self.text = Charmander
		elif showPokemon == "Pikachu":
			self.text = Pikachu
		elif showPokemon == "MewTwo":
			self.text = MewTwo
		else:
			self.text = ""
func _process(delta):
	pass
