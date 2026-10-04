class_name StateMachine extends Node

@export var current_state: State
@export var master: Node

func _ready() -> void:
	if !master: master = get_parent()
	
	if current_state: _enter_current_state()

func _exit_current_state():
	if !current_state:
		return
	
	current_state.change_state.disconnect(change_current_state)
	current_state._state_exit()

func _enter_current_state():
	if !current_state:
		return
	
	current_state.change_state.connect(change_current_state)
	set_process_input(current_state.is_processing_input())
	current_state._state_enter(master)

func change_current_state(new_state: State):
	_exit_current_state()
	current_state = new_state
	_enter_current_state()

func _process(delta: float) -> void:
	if current_state:
		current_state._state_process(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state._state_physics_process(delta)

func _unhandled_input(event: InputEvent) -> void:
	if current_state:
		current_state._state_unhandled_input(event)

func _input(event: InputEvent) -> void:
	if current_state:
		current_state._state_input(event)
