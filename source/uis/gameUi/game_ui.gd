class_name GameUi extends CanvasLayer

@export var dr_pepper_count: int = 3
@export var auto_ui_update: bool = true
@onready var dr_pepper_ui_conteiner: HBoxContainer = $Control/MarginContainer/DrPepperUiConteiner

var dr_pepper_ui_packed: PackedScene = preload("uid://bh45pswisj4m7")
var dr_pepper_collects: int = 0
var dr_peppers_ui: Array[DrPepperUi]

func _ready() -> void:
	if auto_ui_update:
		update_ui()

func update_ui() -> void:
	for dr_pepper_ui_conteiner_child in dr_pepper_ui_conteiner.get_children():
		dr_pepper_ui_conteiner_child.queue_free()
		
	for _i in dr_pepper_count:
		dr_peppers_ui.append(dr_pepper_ui_packed.instantiate())
		
	for dr_pepper_ui in dr_peppers_ui:
		dr_pepper_ui_conteiner.add_child(dr_pepper_ui)

func dr_pepper_collected() -> void:
	if dr_pepper_collects >= dr_peppers_ui.size():
		push_warning("dr_peppers count reached limit")
		return
	
	dr_peppers_ui[dr_pepper_collects].current_state = DrPepperUi.States.full
	dr_pepper_collects += 1
