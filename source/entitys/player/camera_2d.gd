extends Camera2D

@onready var component_follower: ComponentFollower = $ComponentFollower

func _physics_process(_delta: float) -> void:
	component_follower.tick()
