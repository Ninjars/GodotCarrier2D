extends NavigationRegion2D

class_name SeaNavRegion

@export var boundsWidth: float
@export var boundsHeight: float

func buildNavRegion(islands: Array[Island]):
	var navPoly = get_navigation_polygon()
	navPoly.clear_outlines()
	navPoly.clear_polygons()

	var halfWidth = boundsWidth / 2
	var halfHeight = boundsHeight / 2
	navPoly.add_outline(
		PackedVector2Array([
			Vector2(-halfWidth, -halfHeight),
			Vector2(halfWidth, -halfHeight),
			Vector2(halfWidth, halfHeight),
			Vector2(-halfWidth, halfHeight),
		]))
#	navPoly.add_outline(
#		PackedVector2Array([
#			Vector2(-500, -500),
#			Vector2(500, -500),
#			Vector2(500, 500),
#			Vector2(-500, 500),
#		]))
#
#	navPoly.add_outline(
#		PackedVector2Array([
#			Vector2(-300, -300),
#			Vector2(300, -300),
#			Vector2(300, 300),
#			Vector2(-300, 300),
#		]))
#
#	navPoly.add_outline(
#		PackedVector2Array([
#			Vector2(-10, -10),
#			Vector2(10, -10),
#			Vector2(10, 10),
#			Vector2(-10, 10),
#		]))
		
	## TODO: re-add this in Godot 4.2 to see if holes work
	#parseIslandCollider(navPoly, islands)
	
	navPoly.make_polygons_from_outlines()
	
	set_navigation_polygon(navPoly)

func parseIslandCollider(navPolygon: NavigationPolygon, islands: Array[Island]):
	print(str("parseIslandCollider for ", islands.size(), " islands"))
	for island in islands:
		var collisionPolygon: PackedVector2Array = island.collisionShape.polygon
		var collisionPolygonTransform: Transform2D = island.collisionShape.get_global_transform()

		var new_collision_outline: PackedVector2Array = collisionPolygonTransform * collisionPolygon

		navPolygon.add_outline(new_collision_outline)
