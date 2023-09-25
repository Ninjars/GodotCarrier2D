extends CharacterBody2D
class_name Ship

@export var faction: Constants.Faction

@export var rotationDegreesPerSecond: float = 20
@export var headingAlignmentDegrees: float = 25

@export var speed: float = 10

@onready var gameManager: GameManager = get_node("/root/Main")
@onready var navAgent: NavigationAgent2D = $NavigationAgent2D

var rotationRadsPerSecond = deg_to_rad(rotationDegreesPerSecond)
var headingAlignmentRads = deg_to_rad(headingAlignmentDegrees)

func _ready():
	gameManager.registerShip(self)
	
func _physics_process(delta):
	if navAgent.is_navigation_finished():
		return
	
	var nextPathPos = navAgent.get_next_path_position()
	var targetDirection = nextPathPos - global_position
	
	var targetAngle = transform.x.angle_to(targetDirection)
	rotate(sign(targetAngle) * min(delta * rotationRadsPerSecond, abs(targetAngle)))
	
	#print(str("position ", global_position, " target ", nextPathPos, " reachable? ", navAgent.is_target_reachable()))
	#print(str("rotation ", rotation, " targetAngle ", targetAngle))
	
	if abs(targetAngle) < headingAlignmentRads:
		# sufficiently aligned to accelerate
		velocity = transform.x * speed
	else:
		velocity = Vector2.ZERO
	move_and_slide()
	
func setNavigationDestination(destination: Vector2):
	print(str("setNavigationDestination ", destination))
	navAgent.target_position = destination
