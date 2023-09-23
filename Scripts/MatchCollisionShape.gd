extends CollisionPolygon2D

@export var shape: Polygon2D

func _ready():
	polygon = shape.polygon
	translate(shape.position)
