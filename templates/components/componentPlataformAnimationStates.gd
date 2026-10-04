@tool
class_name ComponentPlataformAnimationStates extends Component

var is_falling: bool = false
var is_uping: bool = false
var is_walk: bool = false
var is_look_to_left: bool = false

func update(input_dir: Vector2, velocity: Vector2) -> void:
	is_walk = input_dir.x != 0
	
	if input_dir.x != 0:
		is_look_to_left = input_dir.x < 0
	
	is_falling = velocity.y > 0
	is_uping =  velocity.y < 0
