extends StaticBody2D

class_name Island

@export var gameManager: GameManager
@export var collisionShape: Polygon2D

func _enter_tree():
	gameManager.registerIsland(self)
