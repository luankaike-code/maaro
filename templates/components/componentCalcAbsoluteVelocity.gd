@tool
class_name ComponentCalcAbsoluteVelocity extends Component

@export var components: Array[ComponentWithCharacterBody2D]

func get_absolute_velocity() -> Vector2:
	var absolute_velocity: Vector2 = Vector2.ZERO
	
	for component in components:
		absolute_velocity += component.velocity
	
	return absolute_velocity
