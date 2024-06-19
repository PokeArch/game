extends CharacterBody2D

var PokemonName = "Charmander"

var health = 100
var enemy : bool
var friendly : bool

@onready var flash_animation = $EnemySide/FlashAnimation
@onready var flash_friendly = $FriendlySide/FlashFriendly
@onready var attacks = $attacks
@onready var enemyattacks = $splAttackEnemy

var hitEnemy = false
var hitFriendly = false
var bite
var sword
var spike
var spl = null
var enemySplAttack = null

func _ready():
	PokemonName = "Charmander"
	spl = null
	enemySplAttack = null
	enemyattacks.visible = false
	attacks.visible = false
	if enemy == true:
		$FriendlySide.visible = false
		$EnemySide.visible = true
	elif friendly == true:
		$FriendlySide.visible = true
		$EnemySide.visible = false
	health = 100
	
func _process(delta):
	handle_attack_animations()
	
func handle_attack_animations():
	if hitEnemy == true:
		flash_animation.play("flash")
	if bite == true:
		attacks.visible = true
		attacks.play("bite")
	if Game.bite == true:
		flash_friendly.play("flashFriendly")
	if sword == true:
		attacks.visible = true
		attacks.play("sword")
	if Game.sword == true:
		flash_friendly.play("flashFriendly")
	if spike == true:
		attacks.visible = true
		attacks.play("spike")
	if Game.spike == true:
		flash_friendly.play("flashFriendly")
	if spl:
		attacks.visible = true
		attacks.play(spl)
	if enemySplAttack:
		enemyattacks.visible = true
		enemyattacks.play(enemySplAttack)
		flash_friendly.play("flashFriendly")
		
func _on_attacks_animation_finished():
	Game.bite = false
	Game.sword=false
	Game.spike = false
	hitEnemy = false
	bite = false
	sword=false
	spike=false
	spl = null
	attacks.visible=false
	


func _on_spl_attack_enemy_animation_finished():
	Game.splAttackEnemy = false
	enemyattacks.visible = false
	enemySplAttack = null
	
