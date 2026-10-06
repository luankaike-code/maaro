extends Screen

@onready var game_ui: GameUi = $GameUi
@onready var dr_pepper_conteiner: Node2D = $Node2D/DrPepperConteiner

func _ready() -> void:
	game_ui.dr_pepper_count = 0
	for dr_pepper in dr_pepper_conteiner.get_children():
		game_ui.dr_pepper_count += 1
		dr_pepper.collected.connect(game_ui.dr_pepper_collected)
	game_ui.update_ui()
