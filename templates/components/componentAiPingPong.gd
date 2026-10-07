@tool
class_name ComponentAiPingPong extends Component

signal direction_changed()

@export var direction: Vector2 = Vector2(1, 0) :
	set(new_direction):
		if new_direction == direction:
			return
		direction = new_direction
		direction_changed.emit()
		

@export var body: CharacterBody2D:
	set(new_body):
		body = new_body
		if Engine.is_editor_hint():
			update_configuration_warnings()

func _get_configuration_warnings() -> PackedStringArray:
	var warnings = super()

	if !body:
		warnings.append("Define body")

	return warnings

func _ready() -> void:
	if Engine.is_editor_hint():
		update_configuration_warnings()

func update() -> void:
	if body.is_on_wall():
		direction = body.get_wall_normal()
