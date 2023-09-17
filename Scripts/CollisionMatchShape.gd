extends CollisionPolygon2D

func _ready():
	var shape: Polygon2D = get_parent().get_node("Shape")
	if shape != null:
		polygon = shape.polygon
