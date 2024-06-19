extends Node2D

var Pikachu = "Name: Pikachu\nSpecial Attack: Thunderbolt\nType: Electric\n\nDescription: Pikachu is a small, yellow, mouse-like Pokémon known for its ability to generate electricity."

var MewTwo = "Name: MewTwo\nSpecial Attack: Jaadu\nType: Psychic\n\nDescription: Mewtwo is a legendary Pokémon created through genetic manipulation. It is known for its immense psychic power."

var Bulbasaur = "Name: Bulbasaur\nSpecial Attack: Tail Whip\nType: Grass/Poison\n\nDescription: Bulbasaur is a small, quadruped Pokémon with a plant bulb on its back. As it evolves, the bulb blossoms into a large flower."

var Charmander = "Name: Charmander\nSpecial Attack: Fire\nType: Fire\n\nDescription: Charmander is a dinosaur-like Pokémon with a flame on the tip of its tail. The flame's size indicates Charmander's health."

var Squirtle = "Name: Squirtle
Special Attack: Aqua jet
Type: Water

Description: Squirtle is a small turtle-like Pokémon. It has a tough shell that provides defense and can shoot water from its mouth."

var Hypno = "Name: Hypno
Special Attack: Hypnosis
Type: Psychic

Description: Hypno is a humanoid Pokémon with a pendulum that swings to put others into a deep sleep. Its hypnotic powers are potent.
"

@onready var BerryCount = $ItemLibrary/BerriesCount
@onready var tradeMenu = $TradePokemon

@onready var FirstPosition = $FirstPosition
@onready var FirstPositionHealthbar = $FirstPosition/HealthBar
@onready var FirstPositionPokemons = $FirstPosition/Pokemons
@onready var FirstPositionText = $FirstPosition/PokemonDetails
@onready var FirstPositionDefaultPokemon = $FirstPosition/Button2


@onready var SecondPosition = $SecondPosition
@onready var SecondPositionHealthbar = $SecondPosition/HealthBar
@onready var SecondPositionPokemons = $SecondPosition/Pokemons
@onready var SecondPositionText = $SecondPosition/PokemonDetails
@onready var SecondPositionDefaultPokemon = $SecondPosition/Button2

@onready var ThirdPosition = $ThirdPosition
@onready var ThirdPositionHealthbar = $ThirdPosition/HealthBar
@onready var ThirdPositionPokemons = $ThirdPosition/Pokemons
@onready var ThirdPositionText = $ThirdPosition/PokemonDetails
@onready var ThirdPositionDefaultPokemon = $ThirdPosition/Button2

@onready var FourthPosition = $FourthPosition
@onready var FourthPositionHealthbar = $FourthPosition/HealthBar
@onready var FourthPositionPokemons = $FourthPosition/Pokemons
@onready var FourthPositionText = $FourthPosition/PokemonDetails
@onready var FourthPositionDefaultPokemon = $FourthPosition/Button2

@onready var FifthPosition = $FifthPosition 
@onready var FifthPositionHealthbar = $FifthPosition/HealthBar
@onready var FifthPositionPokemons = $FifthPosition/Pokemons
@onready var FifthPositionText = $FifthPosition/PokemonDetails
@onready var FifthPositionDefaultPokemon = $FifthPosition/Button2



var pokemon_keys

func _ready():
	self.visible = false
	FirstPosition.visible = false
	SecondPosition.visible = false
	ThirdPosition.visible = false
	FourthPosition.visible = false
	FifthPosition.visible = false
	
	handleInventory()
	handleConnection()
	

func _process(delta):
	updateHealth()
	
	#pokemon_keys = Game.player_pokemon.keys()
	#handleInventory()
	if Game.player_berries > 0:
		BerryCount.text = "Berries : " + str(Game.player_berries)
	else:
		BerryCount.text = "No Berries :("
		
	if Input.is_action_just_pressed("Inventory"):
		self.visible = not self.visible

func handleInventory():
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
		handleData()
			
	
func matchPokemon(pokemon_name):
	match pokemon_name:
		"Pikachu":
			return Pikachu
		"MewTwo":
			return MewTwo
		"Bulbasaur":
			return Bulbasaur
		"Charmander":
			return Charmander
		"Squirtle":
			return Squirtle
		"Hypno":
			return Hypno
		_:
			return ""

func updateHealth():
	if pokemon_keys:
		if pokemon_keys.size() == 1:
			Game.player_pokemon[pokemon_keys[0]]["health"] = FirstPositionHealthbar.Health
		elif pokemon_keys.size() == 2:
			Game.player_pokemon[pokemon_keys[0]]["health"] = FirstPositionHealthbar.Health
			Game.player_pokemon[pokemon_keys[1]]["health"] = SecondPositionHealthbar.Health
		elif pokemon_keys.size() == 3:
			Game.player_pokemon[pokemon_keys[0]]["health"] = FirstPositionHealthbar.Health
			Game.player_pokemon[pokemon_keys[1]]["health"] = SecondPositionHealthbar.Health
			Game.player_pokemon[pokemon_keys[2]]["health"] = ThirdPositionHealthbar.Health
		elif pokemon_keys.size() == 4:
			Game.player_pokemon[pokemon_keys[0]]["health"] = FirstPositionHealthbar.Health
			Game.player_pokemon[pokemon_keys[1]]["health"] = SecondPositionHealthbar.Health
			Game.player_pokemon[pokemon_keys[2]]["health"] = ThirdPositionHealthbar.Health
			Game.player_pokemon[pokemon_keys[3]]["health"] = FourthPositionHealthbar.Health
		elif pokemon_keys.size() == 5:
			Game.player_pokemon[pokemon_keys[0]]["health"] = FirstPositionHealthbar.Health
			Game.player_pokemon[pokemon_keys[1]]["health"] = SecondPositionHealthbar.Health
			Game.player_pokemon[pokemon_keys[2]]["health"] = ThirdPositionHealthbar.Health
			Game.player_pokemon[pokemon_keys[3]]["health"] = FourthPositionHealthbar.Health
			Game.player_pokemon[pokemon_keys[4]]["health"] = FifthPositionHealthbar.Health
			
func handleData():
	if FirstPosition.visible == true:
		FirstPositionPokemons.showPokemon = pokemon_keys[0]
		FirstPositionDefaultPokemon.name = pokemon_keys[0]
		FirstPositionText.text = matchPokemon(pokemon_keys[0])
		FirstPositionHealthbar._set_Health(Game.player_pokemon[pokemon_keys[0]]["health"])
	if SecondPosition.visible == true:
		SecondPositionPokemons.showPokemon = pokemon_keys[1]
		SecondPositionDefaultPokemon.name = pokemon_keys[1]
		SecondPositionText.text = matchPokemon(pokemon_keys[1])
		SecondPositionHealthbar._set_Health(Game.player_pokemon[pokemon_keys[1]]["health"])
	if ThirdPosition.visible == true:
		ThirdPositionPokemons.showPokemon = pokemon_keys[2]
		ThirdPositionDefaultPokemon.name = pokemon_keys[2]
		ThirdPositionText.text = matchPokemon(pokemon_keys[2])
		ThirdPositionHealthbar._set_Health(Game.player_pokemon[pokemon_keys[2]]["health"])
	if FourthPosition.visible == true:
		FourthPositionPokemons.showPokemon = pokemon_keys[3]
		FourthPositionDefaultPokemon.name = pokemon_keys[3]
		FourthPositionText.text = matchPokemon(pokemon_keys[3])
		FourthPositionHealthbar._set_Health(Game.player_pokemon[pokemon_keys[3]]["health"])
	if FifthPosition.visible == true:
		FifthPositionPokemons.showPokemon = pokemon_keys[4]
		FifthPositionDefaultPokemon.name = pokemon_keys[4]
		FifthPositionText.text = matchPokemon(pokemon_keys[4])
		FifthPositionHealthbar._set_Health(Game.player_pokemon[pokemon_keys[4]]["health"])
	
func handleConnection():
	FirstPositionDefaultPokemon.pressed.connect(_on_button_pressed.bind(FirstPositionDefaultPokemon))
	SecondPositionDefaultPokemon.pressed.connect(_on_button_pressed.bind(SecondPositionDefaultPokemon))
	ThirdPositionDefaultPokemon.pressed.connect(_on_button_pressed.bind(ThirdPositionDefaultPokemon))
	FourthPositionDefaultPokemon.pressed.connect(_on_button_pressed.bind(FourthPositionDefaultPokemon))
	FifthPositionDefaultPokemon.pressed.connect(_on_button_pressed.bind(FifthPositionDefaultPokemon))


func _on_trade_pokemons_pressed():
	var tween = create_tween()
	tween.tween_property(tradeMenu , "visible", true , 0.3)
	
func _on_button_pressed(button):
	Game.player_default_pokemon = button.name
	print("Default pokemon: "+ Game.player_default_pokemon)


func _on_market_place_pressed():
	pass # Replace with function body.
