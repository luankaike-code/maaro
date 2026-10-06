class_name DrPepper extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

signal collected()

func _ready() -> void:
	animation_player.play("idle")

func collect() -> void:
	collected.emit()
	queue_free()
