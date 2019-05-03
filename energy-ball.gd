extends Area2D

var player_in_collission = false
var energy_remaining = true
var energy_value = 5

signal energy_taken(value)


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
		print("interact")
		if energy_remaining == true:
			emit_signal("energy_taken",energy_value)
			var label = get_node("Sprite/Value")
			label.set_text("0")
			var EnergyVariables = get_node("/root/EnergyVariables")
			EnergyVariables.AddEnergy(energy_value)
			energy_remaining = false
			print("energy here")
			var lock1 = get_node("../Lock1")
			var energ = get_node("../Player")
			energ.updatelbl(str(EnergyVariables.CurrentEnergy))
			if EnergyVariables.CurrentEnergy == lock1.energyvalue:
				lock1.unlock()
			else:
				lock1.lock()
	pass
