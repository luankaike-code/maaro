@tool
class_name ComponentMove extends Component

enum Modes {
	Plataform,
	TopDown
}

@export var mode: Modes = Modes.Plataform

@export var speed: float = 500.0
@export var max_speed: float = 1000.0

@export var body: CharacterBody2D:
	set(new_body):
		body = new_body
		if Engine.is_editor_hint():
			update_configuration_warnings()

var direction: Vector2 = Vector2.ZERO

var velocity: Vector2 = Vector2.ZERO :
	set(new_velocity):
		velocity.x = clampf(new_velocity.x, -max_speed, max_speed)
		if mode == Modes.TopDown:
			velocity.y = clampf(new_velocity.y, -max_speed, max_speed)
		else:
			velocity.y = new_velocity.y

func _get_configuration_warnings() -> PackedStringArray:
	var warnings = super()

	if !body:
		warnings.append("Define body")

	return warnings

func _ready() -> void:
	if Engine.is_editor_hint():
		update_configuration_warnings()

func tick() -> void:
	velocity += direction * speed
	
	if !direction.x:
		velocity.x = 0
	if !direction.y && mode == Modes.TopDown:
		velocity.y = 0
	
	body.velocity = velocity
	body.move_and_slide()
