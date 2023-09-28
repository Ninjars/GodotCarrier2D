extends Node2D

# Parent class for human and ai controllers
# PlayerControllers are the entity that governs a player, tracks their units and affiliations,
# receives and handles input and produces gui for human players.
# AI controllers will hold the state and logic for the ai's centralised decision making.
class_name PlayerController

@export var gameManager: GameManager

@export var faction: Constants.Faction
@export var id: String
@export var color: Color

@export var units: Array[Ship]

func _enter_tree():
	gameManager.registerPlayer(self)

func registerShip(ship: Ship):
	units.append(ship)
