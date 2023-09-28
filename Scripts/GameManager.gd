extends Node

class_name GameManager

@export var seaNavRegion: SeaNavRegion

var islands: Array[Island] = []
var players: Array[PlayerController] = []

func _ready():
	seaNavRegion.buildNavRegion(islands)

func registerIsland(island: Island):
	islands.append(island)
			
func registerPlayer(player: PlayerController):
	players.append(player)
