@tool
class_name ComponentGravity extends ComponentWithCharacterBody2D

@export var multiply: float = 1.0

var force: Vector2 = Vector2.ZERO

func tick(delta: float) -> void:
	if not body.is_on_floor():
		velocity += body.get_gravity() * multiply * delta
	else:
		velocity = Vector2.ZERO
	
