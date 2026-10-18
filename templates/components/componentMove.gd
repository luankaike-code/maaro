@tool
class_name ComponentMove extends ComponentWithCharacterBody2D

@export var speed: float = 500.0

var direction: Vector2 = Vector2.ZERO

func tick() -> void:
	velocity += direction * speed
	
	if !direction.x:
		velocity.x = 0
	if !direction.y:
		velocity.y = 0
