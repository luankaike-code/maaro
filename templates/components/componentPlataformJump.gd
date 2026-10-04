@tool
class_name ComponentPlataformJump extends Component

@export var force: float = -500.0
@export var multiply: float = 1.0
@export var max_count: int = 1

@export var body: CharacterBody2D:
	set(new_body):
		body = new_body
		if Engine.is_editor_hint():
			update_configuration_warnings()

var velocity_y: float = 0.0
var current_count: int

signal jumped()

func _get_configuration_warnings() -> PackedStringArray:
	var warnings = super()

	if !body:
		warnings.append("Define body")

	return warnings

func _ready() -> void:
	if Engine.is_editor_hint():
		update_configuration_warnings()

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
