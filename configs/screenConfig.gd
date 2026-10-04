class_name ScreensConfig extends Node

enum Id {
	Menu,
	Game
}

static var packeds: Dictionary[Id, PackedScene] = {
	Id.Menu: load("uid://dmfos4toqg5li"),
	Id.Game: load("uid://ckb13ndgdxdxs")
}
