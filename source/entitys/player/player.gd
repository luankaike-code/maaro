class_name Player extends CharacterBody2D

@onready var component_move: ComponentMove = $ComponentMove
@onready var component_input: ComponentInput = $ComponentInput
@onready var component_gravity: ComponentGravity = $ComponentGravity
@onready var component_plataform_jump: ComponentPlataformJump = $ComponentPlataformJump

func _physics_process(_delta: float) -> void:
	component_gravity.tick()
	component_input.update()
	
	component_plataform_jump.update(component_input.action_1_pressed)
	
	component_move.direction = component_input.move_dir
	component_move.direction.y += component_plataform_jump.velocity_y
	component_move.tick()
