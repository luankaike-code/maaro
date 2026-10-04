@tool
class_name ComponentGravity extends Component

@export var multiply: float = 1.0

@export var body: CharacterBody2D:
	set(new_body):
		body = new_body
		if Engine.is_editor_hint():
			update_configuration_warnings()

var force: Vector2 = Vector2.ZERO

func _get_configuration_warnings() -> PackedStringArray:
	var warnings = super()

	if !body:
		warnings.append("Define body")

	return warnings

func _ready() -> void:
	if Engine.is_editor_hint():
		update_configuration_warnings()

func tick() -> void:
	if not body.is_on_floor():
		body.velocity.y += body.get_gravity().y * multiply
		body.move_and_slide()
