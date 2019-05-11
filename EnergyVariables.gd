extends Node

var CurrentEnergy = 0
var CurrentLevel = 1
signal Energy_Changed 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func AddEnergy(value):
	CurrentEnergy+=value
	emit_signal("Energy_Changed")
	
func RestartEnergy():
	CurrentEnergy=0
	
	
func RestartLevel():
	RestartEnergy()
	get_tree().reload_current_scene()

func NextLevel():
	RestartEnergy()
	CurrentLevel = CurrentLevel+1
	if CurrentLevel == 2:
		get_tree().change_scene("res://Level_2.tscn")
	if CurrentLevel == 3:
		get_tree().change_scene("res://Test_Level.tscn")
	emit_signal("Energy_Changed")
	print("ganti level")