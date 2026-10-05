@tool
class_name ComponentFollower extends Component

@export var target: Node2D
@export var reference: Node2D
@export var speed: float = 20
@export var max_distance: float = 200 

func get_movimentation() -> Vector2:
	var reference_gpos = reference.global_position
	var target_gpos = target.global_position
	
	var distance: float = reference_gpos.distance_to(target_gpos)

	if distance > max_distance:
		var delta_distance = distance - max_distance
		return reference_gpos.move_toward(target_gpos, delta_distance)
	else:
		return reference_gpos.move_toward(target_gpos, speed)
