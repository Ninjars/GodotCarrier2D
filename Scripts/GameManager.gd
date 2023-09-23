extends Node2D

class_name GameManager

@export var seaNavRegion: SeaNavRegion

var islands: Array[Island] = []

func _ready():
	seaNavRegion.buildNavRegion(islands)

func registerIsland(island: Island):
	islands.append(island)
