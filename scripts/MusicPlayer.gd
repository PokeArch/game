extends AudioStreamPlayer


const menu_music = preload("res://Sound/MenuMusic.mp3") 
const level_music = preload("res://Sound/World.mp3")
const battle_music = preload("res://Sound/BattleScene.mp3")

func _play_music(music : AudioStream,volume = 0.0):
	if stream == music:
		return
	stream = music
	volume_db = volume
	play()
	
func play_menu_music():
	_play_music(menu_music)

func play_level_music():
	_play_music(level_music)

func play_battle_music():
	_play_music(battle_music)
	
func stop_music():
	self.stop()

func play_fx(stream : AudioStream,volume = 0.0):
	var fx_player = AudioStreamPlayer.new()
	fx_player.stream = stream
	fx_player.name = "FX_PLAYER"
	fx_player.volume_db = volume
	add_child(fx_player)
	fx_player.play()
	
	await fx_player.finished
	fx_player.queue_free()
