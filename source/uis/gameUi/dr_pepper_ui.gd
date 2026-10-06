class_name DrPepperUi extends TextureRect

enum States {
	empty,
	full
}

var states_region: Dictionary[States, Rect2] = {
	States.empty: Rect2(16*3, 0, 16, 16),
	States.full: Rect2(0, 0, 16, 16)
}

@export var current_state: States = States.empty :
	set(new_current_state):
		current_state = new_current_state
		update_texture()

func _ready() -> void:
	update_texture()

func update_texture() -> void:
	texture.region = states_region[current_state]
