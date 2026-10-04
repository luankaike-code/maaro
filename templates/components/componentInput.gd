@tool
class_name ComponentInput extends Component

var move_dir: Vector2 = Vector2.ZERO
var action_1_pressed: bool = false
var action_2_pressed: bool = false
var action_3_pressed: bool = false

func update()-> void:
	move_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	action_1_pressed = Input.is_action_just_pressed("action_1")
	action_2_pressed = Input.is_action_just_pressed("action_2")
	action_3_pressed = Input.is_action_just_pressed("action_3")
