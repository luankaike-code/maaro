extends Screen

@onready var game_ui: GameUi = $GameUi

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("action_2"):
		game_ui.dr_pepper_collected()
