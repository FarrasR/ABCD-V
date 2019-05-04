extends KinematicBody2D

var locked = true
export var energyvalue = 5

func _ready():
	get_node("Label").set_text(str(energyvalue))

func _process(delta):
	var EnergyVariables = get_node("/root/EnergyVariables")
	if EnergyVariables.CurrentEnergy == energyvalue and locked == true:
		unlock()
		locked = false
	
	if EnergyVariables.CurrentEnergy != energyvalue and locked == false:
		lock()
		locked = true
	pass

func unlock():
	var spirit = get_node("Sprite")
	spirit.region_rect = Rect2(0,64,64,64)
	set_process_unhandled_input(false)
	set_process_input(false)
	get_node("CollisionShape2D").set_disabled(true)

func lock():
	var spirit = get_node("Sprite")
	spirit.region_rect = Rect2(0,0,64,64)
	set_process_unhandled_input(true)
	set_process_input(true)
	get_node("CollisionShape2D").set_disabled(false)
