extends StaticBody2D
var in_range= false


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pluck()
	


func pluck():
	if in_range and Input.is_action_just_pressed("Pluck"):
		$AnimatedSprite2D.visible=false
		Game.player_berries+=1
		var new_shape = CircleShape2D.new()
		new_shape.radius = 0.00
		var collision_shape = $Area2D/CollisionShape2D
		collision_shape.shape = new_shape
		$Timer.start()
		#self.queue_free()
		

func _on_area_2d_body_entered(body):
	if body.name=="player":
		in_range=true


func _on_area_2d_body_exited(body):
	if body.name=="player":
		in_range=false


func _on_timer_timeout():
	$AnimatedSprite2D.visible=true
	var new_shape = CircleShape2D.new()
	new_shape.radius = 20
	var collision_shape = $Area2D/CollisionShape2D
	collision_shape.shape = new_shape
	$Timer.stop()
