@tool
class_name ComponentPlataformJump extends ComponentWithCharacterBody2D

@export var force: float = -1.0
@export var multiply: float = 1.0
@export var max_count: int = 1

var velocity_y: float = 0.0
var current_count: int

signal jumped()

func update(try_jump: bool) -> void:
	if body.is_on_floor():
		current_count = 0
	
	if !try_jump:
		velocity_y = 0
		return
	
	if max_count < 0 || current_count < max_count:
		velocity_y = force * multiply
		jumped.emit()
		current_count += 1
