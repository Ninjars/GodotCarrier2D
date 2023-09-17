extends RigidBody2D

@export var engineResponse: float = 0.5
@export var acceleration: float  = 10
@export var turnResponse: float  = 0.75
@export var torque: float  = 10
@export var maxForwardSpeed: float  = 30
@export var maxReverseSpeed: float  = -10

var inputRotation: float = 0
var inputAcceleration: float = 0

var currentTorque: float = 0
var currentAcceleration: float = 0
var currentSpeed: float = 0

func _process(delta):
	updateInput()
	
func _physics_process(delta):
	updateFromInput(delta)
	
	apply_torque(currentTorque)
	apply_central_force(-get_transform().y * currentAcceleration)
	
func updateFromInput(delta):
	var targetTorque = inputRotation * torque
	var targetAcceleration = inputAcceleration * acceleration
	
	currentTorque += (targetTorque - currentTorque) * turnResponse * delta
	currentAcceleration += (targetAcceleration - currentAcceleration) * engineResponse * delta
	
func updateInput():
	inputRotation = 0
	inputAcceleration = 0
	if (Input.is_action_pressed("rotate_left")):
		inputRotation -= 1
	if (Input.is_action_pressed("rotate_right")):
		inputRotation += 1
	if (Input.is_action_pressed("decelerate")):
		inputAcceleration -= 1
	if (Input.is_action_pressed("accelerate")):
		inputAcceleration += 1
