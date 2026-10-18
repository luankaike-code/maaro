@tool
class_name ComponentGravity extends Component

@export var multiply: float = 1.0
@export var max_velocity: float = 100.0

@export var body: CharacterBody2D:
	set(new_body):
		body = new_body
		if Engine.is_editor_hint():
			update_configuration_warnings()

var force: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO :
	set(new_velocity):
		velocity.x = clampf(new_velocity.x, -max_velocity, max_velocity)
		velocity.y = clampf(new_velocity.y, -max_velocity, max_velocity)

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
		velocity += body.get_gravity() * multiply
	else:
		velocity = Vector2.ZERO
	
	body.velocity = velocity
	body.move_and_slide()
