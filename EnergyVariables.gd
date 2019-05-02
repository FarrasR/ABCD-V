extends Node

var CurrentEnergy = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func AddEnergy(value):
	CurrentEnergy+=value
	
func RestartEnergy():
	CurrentEnergy=0


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
