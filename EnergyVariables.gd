extends Node

var CurrentEnergy = 0
var CurrentLevel = 1
signal Energy_Changed 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func AddEnergy(value):
	CurrentEnergy=CurrentEnergy + value
	print(CurrentEnergy)
	emitting()
	
func RestartEnergy():
	CurrentEnergy=0
	
	
func emitting():
	emit_signal("Energy_Changed")
	print("emitting ")
	
func RestartLevel():
	RestartEnergy()
	get_tree().reload_current_scene()

func NextLevel():
	RestartEnergy()
	CurrentLevel = CurrentLevel+1
	if CurrentLevel == 2:
		get_tree().change_scene("res://Level_2.tscn")
	if CurrentLevel == 3:
		get_tree().change_scene("res://Level_3.tscn")
	if CurrentLevel == 4:
		get_tree().change_scene("res://Level_4.tscn")
	if CurrentLevel == 5:
		get_tree().change_scene("res://Level_5.tscn")
	if CurrentLevel == 6:
		get_tree().change_scene("res://Level_6.tscn")
	if CurrentLevel == 7:
		get_tree().change_scene("res://Level_7.tscn")
	if CurrentLevel == 8:
		get_tree().change_scene("res://GameEnd.tscn")
		CurrentLevel = 1
		
	emitting()
	print("ganti level")