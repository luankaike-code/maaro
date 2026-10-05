extends Camera2D

@onready var component_follower: ComponentFollower = $ComponentFollower

func _physics_process(_delta: float) -> void:
	global_position = component_follower.get_movimentation()
