@tool
class_name ComponentPlataformJump extends ComponentWithCharacterBody2D

@export var force: float = -1.0
@export var multiply: float = 1.0
@export var max_count: int = 1

var current_count: int

var velocity: Vector2 = Vector2.ZERO

signal jumped()

func try_jump() -> void:
	if max_count > 0 && current_count >= max_count:
		return
	
	jumped.emit()
	current_count += 1
	
	velocity = Vector2(0, force * multiply)

func update(gravity_velocity: Vector2) -> void:
	velocity += gravity_velocity
	if body.is_on_floor():
		current_count = 0
