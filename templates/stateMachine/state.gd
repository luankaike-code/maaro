class_name State extends Node

@warning_ignore("unused_signal")
signal change_state(new_state: State)

func _ready() -> void:
	set_process_input(false)

@warning_ignore("unused_parameter")
func _state_enter(master: Node) -> void:
	pass

@warning_ignore("unused_parameter")
func _state_process(delta: float) -> void:
	pass

@warning_ignore("unused_parameter")
func _state_physics_process(delta: float) -> void:
	pass

@warning_ignore("unused_parameter")
func _state_unhandled_input(event: InputEvent) -> void:
	pass

@warning_ignore("unused_parameter")
func _state_input(event: InputEvent) -> void:
	pass

func _state_exit() -> void:
	pass
