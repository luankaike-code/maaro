@tool
class_name ComponentHealth extends Component

@export var max_health: float = 20
@export var current_health: float =  max_health : 
	set(new_current_health):
		current_health = clampf(new_current_health, 0.0, max_health)
		
		is_dead = current_health == 0.0
		
		changed_health.emit()

var _old_is_dead: bool = false
var is_dead: bool = false :
	set(new_is_dead):
		if new_is_dead == _old_is_dead:
			return
		
		is_dead = new_is_dead
		_old_is_dead = is_dead
		
		if is_dead: died.emit()
		else: revived.emit()

signal changed_health()
signal died()
signal revived()

func take_damage(amount: float) -> void:
	current_health -= amount

func heal(amount: float) -> void:
	current_health += amount
