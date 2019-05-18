extends Area2D

var player_in_collission = false
var energy_remaining = true
export var energy_value = 5
signal energy_taken(value)

onready var glowing_anim = get_node("Sprite/SpriteGlow/AnimationPlayer")


func _ready():
	connect("body_entered", self, "_on_player_enter")
	connect("body_exited", self, "_on_player_exited")
	var label = get_node("Sprite/Value")
	label.set_text(str(energy_value))
	glowing_anim.play("Glowing")
	pass 
	
func _on_player_enter(body):
	if (body.get_name() == "Player"):
		player_in_collission = true
		
func _on_player_exited(body):
	if (body.get_name() == "Player"):
		player_in_collission = false
	
func _process(delta):
	if player_in_collission == true and Input.is_action_just_pressed("interact"):
		if energy_remaining == true:
			emit_signal("energy_taken",energy_value)
			var label = get_node("Sprite/Value")
			label.set_text("0")
			var EnergyVariables = get_node("/root/EnergyVariables")
			var minusvalue = - energy_value
			EnergyVariables.AddEnergy(minusvalue)
			energy_remaining = false
			glowing_anim.stop(true)
	pass
