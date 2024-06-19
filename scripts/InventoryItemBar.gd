extends ProgressBar

@onready var FeedingBerriesSound = preload("res://Sound/arcade-game-retro-8-bit-losing-points-floor-model-1-00-00.mp3")
var Health = 0 : set= _set_Health

func _set_Health(new_Health):
	var prev_Health = Health
	Health = min(max_value,new_Health)
	value = Health
	


func _init_Health(_Health):
	Health = _Health
	max_value = 100
	value = Health


func _on_button_pressed():
	if Health<100:
		if Game.player_berries>0:
			MusicPlayer.play_fx(FeedingBerriesSound)
			if Health+5>100:
				Health=100
			else:
				Health+=5
			Game.player_berries-=1
			
