extends Area2D

var player_in_collission = false
signal colission_detected

func _ready():
	connect("body_entered", self, "_on_player_enter")
	pass 
	
func _on_player_enter(body):
	
	if (body.get_name() == "Player"):
		var EnergyVariables = get_node("/root/EnergyVariables")
		EnergyVariables.RestartLevel()
	elif(body.get_name() == "Laser" or body.get_name() == "Skull"):
		pass
	else:
		emit_signal("colission_detected")
		
		
		
	
