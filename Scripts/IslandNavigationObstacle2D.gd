extends NavigationObstacle2D

@export var shape: Polygon2D

func _ready():
	vertices = shape.polygon
	translate(shape.position)
	
