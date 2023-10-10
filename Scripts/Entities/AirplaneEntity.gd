extends Node

# Airplanes can move freely but must continually keep moving.
# They have limited fuel that is used over time at different rates depending on their velocity.
# They have limited ammunition and must return to a base in order to replenish fuel and ammo.
# Planes can be selected and ordered to move to an area or to attack a target,
#  though valid targets for attack orders may change depending on the weapons
#  available to that plane.
# When ordered to move to a location the plane will circle the destination at a fuel
#  efficient speed 
# When low on fuel the plane will display a warning. If the warning is not dismissed,
#  the plane will automatically return to base, abandoning its previous order.
# Formations? Group selection? Queued orders? Calculated intercepts?

# UI: 
# - path to current target/destination
# - max range for order indication with and without aircraft retrieval
# - critical damage warning/indicator
# - critical fuel indicator/button

# Planes are hard to hit but easy to destroy.
# Damage model: each attack hitting a plane checks the plane's evasion stat and 
#  the plane's velocity, vs the attack's hit modifier and a random value.
# If the attack's value exceeds the plane's evasion the the plane takes a Hit.
# If the plane takes a hit the attack's crit chance is compared to a random value,
#  and if the attack's value exceeds the random value the Hit is converted to a Critical HitHit
# A plane has a number of Hit points and separately a number of Crit points. 
#  Two or Three Hit points for fighers to one Crit point, with more for larger planes.
# Crit points refers to damage to key systems. When a plane has no Hit points left and
#  must lose another then it must lose a Crit point instead.
# When no Crit points remain the plane is destroyed

class_name AirplaneEntity

@export var maxHitPoints: int = 2
@export var maxCritPoints: int = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
