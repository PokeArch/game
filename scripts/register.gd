extends Node2D

var new_name = ""
var continue_callback = JavaScriptBridge.create_callback(_on_continue_finished)
# Called when the node enters the scene tree for the first time.
func _ready():
	Game.externalator.addGodotFunction('continue',continue_callback)
	if self.visible == true:
		$LineEdit.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Quit"):
		var tween = create_tween()
		tween.tween_property( self , "visible" , false , 0.3)

func _on_line_edit_text_submitted(new_text):
	new_name = new_text


func _on_continue_pressed():
	await JavaScriptBridge.eval("window.registerName('" + new_name + ".arch', 2)")

func _on_continue_finished(cond):
	if cond[0] == "true":
		Game.selected_arch_id = new_name + ".arch"
		await JavaScriptBridge.eval("window.register('" + Game.selected_arch_id + "')")


func _on_back_pressed():
	var tween = create_tween()
	tween.tween_property( self , "visible" , false , 0.3)
