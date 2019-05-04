extends Area2D

var player_in_collission = false

func _ready():
	connect("body_entered", self, "_on_player_enter")
	connect("body_exited", self, "_on_player_exited")
	pass 
	
func _on_player_enter(body):
	if (body.get_name() == "Player"):
		var EnergyVariables = get_node("/root/EnergyVariables")
		EnergyVariables.RestartLevel()
		

