extends ProgressBar

var Health = 0 : set= _set_Health

func _set_Health(new_Health):
	var prev_Health = Health
	Health = min(max_value,new_Health)
	value = Health
		
func _init_Health(_Health):
	max_value = 100
	value = _Health


	
