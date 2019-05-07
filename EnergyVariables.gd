extends Node

var CurrentEnergy = 0
var CurrentLevel = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func AddEnergy(value):
	CurrentEnergy+=value
	
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
		get_tree().change_scene("res://Level_3.tscn")



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
