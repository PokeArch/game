extends ProgressBar


@onready var timer= $Timer
@onready var damagebar= $DamageBar

var Health = 0 : set= _set_Health

func _set_Health(new_Health):
	var prev_Health = Health
	Health = min(max_value,new_Health)
	value = Health
	if Health <= 0:
		pass
	if Health < prev_Health:
		timer.start()
	else:
		damagebar.value = Health


func _init_Health(_Health):
	Health = _Health
	max_value = Health
	value = Health
	damagebar.max_value = Health
	damagebar.value = Health

func _on_timer_timeout():
	damagebar.value= Health

func _physics_process(delta):
	pass
	
