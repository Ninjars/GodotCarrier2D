extends Node2D

class_name GameManager

@export var seaNavRegion: SeaNavRegion

var islands: Array[Island] = []
var playerShips: Array[Ship] = []
var enemyShips: Array[Ship] = []

func _ready():
	seaNavRegion.buildNavRegion(islands)
	
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		# dev hack for always move order
		if !playerShips.is_empty():
			playerShips[0].setNavigationDestination(get_global_mouse_position())

func registerIsland(island: Island):
	islands.append(island)
	
func registerShip(ship: Ship):
	match ship.faction:
		Constants.Faction.PLAYER:
			playerShips.append(ship)
		Constants.Faction.ENEMY:
			enemyShips.append(ship)
