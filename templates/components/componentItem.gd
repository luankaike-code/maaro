@tool
class_name ComponentItem extends Component

@export var item_name: String = "ItemNotNamed!!!"

signal current_state_changed()

@export var current_state: ItemsConfig.ItemStates :
	set(new_current_state):
		if current_state == new_current_state:
			return
		
		current_state = new_current_state
		current_state_changed.emit()
		
		if Engine.is_editor_hint():
			update_configuration_warnings()

func _get_configuration_warnings() -> PackedStringArray:
	var warnings = super()

	if item_name == "ItemNotNamed!!!":
		warnings.append("Define the item name")

	return warnings

func _ready() -> void:
	if Engine.is_editor_hint():
		update_configuration_warnings()
