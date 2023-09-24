extends Node2D

@export var shape: Polygon2D

@export var fillColor: Color = Color.DIM_GRAY
@export var collisionLineColor: Color = Color.WHITE
@export var insideLineColor: Color = Color.WHITE
@export var outsideLineColor: Color = Color.DIM_GRAY
@export var stepDistance: float = 10

func _ready():
	translate(shape.position)

func _draw():
	draw_colored_polygon(shape.polygon, fillColor)
	
	var dupedPolygon = shape.polygon.duplicate()
	dupedPolygon.append(shape.polygon[0])
	draw_polyline(dupedPolygon, collisionLineColor, 5, true)
	
	drawInflatedPolyline(shape.polygon, -stepDistance * 20, Color(insideLineColor, 0.5))
	drawInflatedPolyline(shape.polygon, -stepDistance * 10, insideLineColor)
	drawInflatedPolyline(shape.polygon, stepDistance, outsideLineColor)
	
	drawInflatedPolyline(shape.polygon, stepDistance * 2.5, Color(outsideLineColor, 0.75))
	drawInflatedPolyline(shape.polygon, stepDistance * 5, Color(outsideLineColor, 0.55))
	drawInflatedPolyline(shape.polygon, stepDistance * 8, Color(outsideLineColor, 0.25))
	
	
func drawInflatedPolyline(poly: PackedVector2Array, polyInflation: float, drawColor: Color):
	var offsetPolygons = Geometry2D.offset_polygon(poly, polyInflation, Geometry2D.JOIN_MITER)
	for offsetPoly in offsetPolygons:
		offsetPoly.append(offsetPoly[0])
		draw_polyline(offsetPoly, drawColor, 3, true)
