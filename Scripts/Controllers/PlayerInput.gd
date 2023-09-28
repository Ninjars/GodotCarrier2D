extends Node2D

class_name PlayerInput

@export var controller: HumanController

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		# dev hack for always move order
		if !controller.units.is_empty():
			controller.units[0].setNavigationDestination(get_global_mouse_position())
