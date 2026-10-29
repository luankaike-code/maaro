@tool
class_name ComponentWithCharacterBody2D extends Component

@export var body: CharacterBody2D:
	set(new_body):
		body = new_body
		if Engine.is_editor_hint():
			update_configuration_warnings()

@export var max_velocity: Vector2 = Vector2.ONE * 1000
var velocity: Vector2 = Vector2.ZERO :
	set(new_velocity):
		velocity.x = clampf(new_velocity.x, -max_velocity.x, max_velocity.x)
		velocity.y = clampf(new_velocity.y, -max_velocity.x, max_velocity.x)

func _get_configuration_warnings() -> PackedStringArray:
	var warnings = super()

	if !body:
		warnings.append("Define body")

	return warnings

func _ready() -> void:
	if Engine.is_editor_hint():
		update_configuration_warnings()

func body_is_on_floor() -> bool:
	if body is CharacterBodyPlataform2D:
		return body.plataform_is_on_floor()
	else:
		return body.is_on_floor()
