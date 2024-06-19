extends MarginContainer


@onready var label = $MarginContainer/Label
@onready var timer = $letter_disp

const width =256
var text = ""
var letter_index=0
var letter_time =0.03
var space_time=0.06
var punc_time=0.2

signal finished_disp()

func disp_text(text_disp: String):
	text=text_disp
	label.text=text_disp
	await resized
	custom_minimum_size.x=min(size.x, width)
	if size.x>width:
		label.autowrap_mode=TextServer.AUTOWRAP_WORD
		await resized
		await resized
		custom_minimum_size.y=size.y
	global_position.x-=size.x/2
	global_position.y-=size.y+24
	label.text=""
	_disp_letter()
	
func _disp_letter():
	label.text+=text[letter_index]
	letter_index+=1
	if letter_index>=text.length():
		finished_disp.emit()
		return
	match text[letter_index]:
		"!",".",",","?":
			timer.start(punc_time)
		" ":
			timer.start(space_time)
		_:
			timer.start(letter_time)


func _on_letter_disp_timeout():
	_disp_letter()
