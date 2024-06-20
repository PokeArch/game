extends Node2D

@onready var tradeButton = $TradeButton
@onready var ArchID = $LineEdit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#
#func _on_trade_button_pressed():
	#Game.ArchIdForTrade = ArchID.text
	#print(ArchID.text)
	#print(Game.ArchIdForTrade)


func _on_close_menu_pressed():
	var tween = create_tween()
	tween.tween_property(self , "visible", false , 0.3)


func _on_challenge_player_pressed():
	Game.ArchIdForChallenge = ArchID.text
	await JavaScriptBridge.eval("window.battle('" + ArchID.text + "')")
	print(ArchID.text)
	print(Game.ArchIdForChallenge)
	
