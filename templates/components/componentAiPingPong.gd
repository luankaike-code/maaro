@tool
class_name ComponentAiPingPong extends ComponentWithCharacterBody2D

signal direction_changed()

@export var direction: Vector2 = Vector2(1, 0) :
	set(new_direction):
		if new_direction == direction:
			return
		direction = new_direction
		direction_changed.emit()

func tick() -> void:
	if body.is_on_wall():
		direction = body.get_wall_normal()
