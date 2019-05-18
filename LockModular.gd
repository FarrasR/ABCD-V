extends KinematicBody2D

var locked = true
onready var EnergyVariables = get_node("/root/EnergyVariables") 
export var energyvalue = 5

func _ready():
	EnergyVariables.connect("Energy_Changed", self, "_on_energy_changed")
	get_node("Label").set_text(str(energyvalue))


func _on_energy_changed():
	if (EnergyVariables.CurrentEnergy % energyvalue) == 0 and EnergyVariables.CurrentEnergy != 0:
		unlock()
		locked = false
	else:
		lock()
		locked = true
	pass

func _process(delta):
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