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

func _get_configuration_warnings() -> PackedStringArray:
	var warnings = super()

	if !body:
		warnings.append("Define body")

	return warnings

func _ready() -> void:
	if Engine.is_editor_hint():
		update_configuration_warnings()

func tick() -> void:
	body.velocity += direction * speed
	
	body.velocity.x = clampf(body.velocity.x, -max_speed, max_speed)
	body.velocity.y = clampf(body.velocity.y, -max_speed, max_speed)
	
	if !direction.x:
		body.velocity.x = 0
	if !direction.y && mode == Modes.TopDown:
		body.velocity.y = 0
		
	body.move_and_slide()
