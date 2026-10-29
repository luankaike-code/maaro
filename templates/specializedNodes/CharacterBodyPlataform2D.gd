class_name CharacterBodyPlataform2D extends CharacterBody2D

@export var coyote_time_in_seg: float = 2
@onready var coyote_time_in_seg_buffer: float = 0

func _update_coyote_time(delta: float) -> void:
	if coyote_time_in_seg_buffer > 0 && !is_on_floor():
		coyote_time_in_seg_buffer -= delta
	elif is_on_floor():
		coyote_time_in_seg_buffer = coyote_time_in_seg

func _physics_process(delta: float) -> void:
	_update_coyote_time(delta)

func ignore_next_coyote_time_frame() -> void:
	coyote_time_in_seg_buffer = 0

func plataform_is_on_floor() -> bool:
	return coyote_time_in_seg_buffer > 0
