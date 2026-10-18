@tool
class_name ComponentMove extends ComponentWithCharacterBody2D

enum Modes {
	Plataform,
	TopDown
}

@export var mode: Modes = Modes.Plataform

@export var speed: float = 500.0
@export var max_speed: float = 1000.0

var direction: Vector2 = Vector2.ZERO

var velocity: Vector2 = Vector2.ZERO :
	set(new_velocity):
		velocity.x = clampf(new_velocity.x, -max_speed, max_speed)
		if mode == Modes.TopDown:
			velocity.y = clampf(new_velocity.y, -max_speed, max_speed)
		else:
			velocity.y = new_velocity.y

func tick() -> void:
	velocity += direction * speed
	
	if !direction.x:
		velocity.x = 0
	if !direction.y && mode == Modes.TopDown:
		velocity.y = 0
	
	body.velocity = velocity
	body.move_and_slide()
