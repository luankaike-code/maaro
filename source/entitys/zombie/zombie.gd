class_name Zombie extends CharacterBody2D

@onready var component_move: ComponentMove = $ComponentMove
@onready var component_ai_ping_pong: ComponentAiPingPong = $ComponentAiPingPong
@onready var component_gravity: ComponentGravity = $ComponentGravity
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var component_plataform_animation_states: ComponentPlataformAnimationStates = $ComponentPlataformAnimationStates
@onready var component_calc_absolute_velocity: ComponentCalcAbsoluteVelocity = $ComponentCalcAbsoluteVelocity

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

func move_tick() -> void:
	component_move.direction = component_ai_ping_pong.direction
	component_move.tick()

func _physics_process(delta: float) -> void:
	component_ai_ping_pong.tick()

	component_gravity.tick(delta)
	
	velocity = component_calc_absolute_velocity.get_absolute_velocity()
	move_and_slide()
	component_move.velocity = Vector2.ZERO
