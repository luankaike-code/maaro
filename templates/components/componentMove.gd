@tool
class_name ComponentMove extends ComponentWithCharacterBody2D

enum Modes {
	Plataform,
	TopDown
}

@export var mode: Modes = Modes.Plataform

@export var speed: float = 500.0

var direction: Vector2 = Vector2.ZERO

func tick() -> void:
	velocity += direction * speed
	
	if !direction.x:
		velocity.x = 0
	if !direction.y && mode == Modes.TopDown:
		velocity.y = 0
