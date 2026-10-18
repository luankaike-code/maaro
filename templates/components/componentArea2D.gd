@tool
class_name ComponentArea2D extends Area2D

@export var debug_actived: bool = false

func _get_configuration_warnings() -> PackedStringArray:
	var warnings = PackedStringArray()

	if !get_parent() is Node2D:
		warnings.append("Parent be must Node2D")

	return warnings

func _on_tree_entered() -> void:
	if Engine.is_editor_hint():
		update_configuration_warnings()
