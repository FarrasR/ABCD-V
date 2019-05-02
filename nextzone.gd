extends Area2D

var player_in_collission = false



func _ready():
	connect("body_entered", self, "_on_player_enter")
	connect("body_exited", self, "_on_player_exited")	
	pass 
	
func _on_player_enter(body):
	if (body.get_name() == "Player"):
		player_in_collission = true
		print("enter")
		
func _on_player_exited(body):
	if (body.get_name() == "Player"):
		player_in_collission = false
		print("exit")
	
func _process(delta):
	if player_in_collission == true and Input.is_action_just_pressed("interact"):
		var EnergyVariables = get_node("/root/EnergyVariables")
		EnergyVariables.RestartEnergy()
		print("yoyoyoyo")
	pass
