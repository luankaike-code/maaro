class_name ScreenManager extends Node

@export var current_screen_id: ScreensConfig.Id
var current_screen: Screen

func _ready() -> void:
	_change_current_screen(current_screen_id)

func _get_screen_configurated(screen_id: ScreensConfig.Id) -> Screen:
	var packed_screen: PackedScene = ScreensConfig.packeds[screen_id]
	var screen: Screen = packed_screen.instantiate() as Screen
	
	screen.change_screen.connect(_change_current_screen)
	screen.quit.connect(quit)
	
	return screen

func quit():
	get_tree().quit() # WARING: can not work in mobile

func _change_current_screen(screen_id: ScreensConfig.Id):
	var new_screen: Screen = _get_screen_configurated(screen_id)
	if current_screen:
		current_screen.queue_free()
	
	add_child(new_screen)
	current_screen = new_screen
