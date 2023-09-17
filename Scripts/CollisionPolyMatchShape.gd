extends CollisionPolygon2D

func _ready():
	var shape = get_parent().get_node("Shape")
	if shape != null:
		polygon = shape.polygon
		translate(shape.position)
