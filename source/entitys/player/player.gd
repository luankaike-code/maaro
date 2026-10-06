class_name Player extends CharacterBody2D

@onready var component_move: ComponentMove = $ComponentMove
@onready var component_input: ComponentInput = $ComponentInput
@onready var component_gravity: ComponentGravity = $ComponentGravity
@onready var component_plataform_jump: ComponentPlataformJump = $ComponentPlataformJump
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var component_plataform_animation_states: ComponentPlataformAnimationStates = $ComponentPlataformAnimationStates
@onready var component_interator: ComponentInterator = $ComponentInterator

func _ready() -> void:
	animation_player.play("walk")
	component_interator.interation_entered.connect(_on_interation_entered)

func _on_interation_entered(interation: ComponentInteration) -> void:
	var entity: Node2D = interation.get_parent()
	if entity is DrPepper:
		entity.collect()

func _physics_process(_delta: float) -> void:
	component_gravity.tick()
	component_input.update()
	
	component_plataform_jump.update(component_input.action_1_pressed)
	
	component_move.direction = component_input.move_dir
	component_move.direction.y += component_plataform_jump.velocity_y
	component_move.tick()
	
	component_plataform_animation_states.update(
		component_input.move_dir, velocity
	)
	sprite_2d.flip_h = component_plataform_animation_states.is_look_to_left
	if component_plataform_animation_states.is_falling:
		animation_player.play("fall")
	elif component_plataform_animation_states.is_uping:
		animation_player.play("up")
	elif component_plataform_animation_states.is_walk:
		animation_player.play("walk")
	else:
		animation_player.play("idle")
