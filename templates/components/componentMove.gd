@tool
class_name ComponentMove extends Component

@export var speed: float = 500.0

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
	body.velocity = direction * speed
	body.move_and_slide()
