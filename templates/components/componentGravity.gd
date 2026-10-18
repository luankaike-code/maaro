@tool
class_name ComponentGravity extends ComponentWithCharacterBody2D

@export var multiply: float = 1.0
@export var max_velocity: float = 100.0

var force: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO :
	set(new_velocity):
		velocity.x = clampf(new_velocity.x, -max_velocity, max_velocity)
		velocity.y = clampf(new_velocity.y, -max_velocity, max_velocity)

func tick() -> void:
	if not body.is_on_floor():
		velocity += body.get_gravity() * multiply
	else:
		velocity = Vector2.ZERO
	
	body.velocity = velocity
	body.move_and_slide()
