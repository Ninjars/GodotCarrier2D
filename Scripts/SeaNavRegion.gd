extends NavigationRegion2D

class_name SeaNavRegion

@export var boundsWidth: float
@export var boundsHeight: float

var halfWidth = boundsWidth / 2
var halfHeight = boundsHeight / 2

func buildNavRegion(islands: Array[Island]):
	var navPoly = get_navigation_polygon()
	navPoly.add_outline(
		PackedVector2Array([
			Vector2(-halfWidth, -halfHeight),
			Vector2(halfWidth, -halfHeight),
			Vector2(halfWidth, halfHeight),
			Vector2(-halfWidth, halfHeight),
		]))
	#parseIslandCollider(navPoly, islands)
	navPoly.make_polygons_from_outlines()
	set_navigation_polygon(navPoly)
	enabled = true

func parseIslandCollider(navPolygon: NavigationPolygon, islands: Array[Island]):
	for island in islands:
		var collisionpolygon: PackedVector2Array = island.collisionShape.polygon
		var collisionpolygon_transform: Transform2D = island.get_global_transform()

		var new_collision_outline: PackedVector2Array = collisionpolygon_transform * collisionpolygon

		navPolygon.add_outline(new_collision_outline)
