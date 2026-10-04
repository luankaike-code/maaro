class_name ScreensConfig extends Node

enum Id {
	Menu,
	Game
}

static var packeds: Dictionary[Id, PackedScene] = {
	Id.Game: load("uid://cmer2db0ca8uo")
}
