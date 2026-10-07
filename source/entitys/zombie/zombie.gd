extends CharacterBody2D

@onready var component_move: ComponentMove = $ComponentMove
@onready var component_ai_ping_pong: ComponentAiPingPong = $ComponentAiPingPong
@onready var component_gravity: ComponentGravity = $ComponentGravity
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var component_plataform_animation_states: ComponentPlataformAnimationStates = $ComponentPlataformAnimationStates

func _ready() -> void:
	animation_player.play("move")
	component_ai_ping_pong.direction_changed.connect(_on_direction_changed)

	component_move.direction = component_ai_ping_pong.direction

func _on_direction_changed() -> void:
	component_move.direction = component_ai_ping_pong.direction
	component_plataform_animation_states.update(
		component_ai_ping_pong.direction, velocity
	)

	sprite_2d.flip_h = component_plataform_animation_states.is_look_to_left

func _physics_process(_delta: float) -> void:
	component_ai_ping_pong.update()

	component_gravity.tick()
	component_move.tick()
