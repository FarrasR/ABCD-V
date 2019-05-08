extends Area2D

var player_in_collission = false
var Bullet = preload("res://Laser.tscn")
var cooldown
var player_position
var direction


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "_on_player_enter")
	connect("body_exited", self, "_on_player_exited")
	cooldown = true
	pass # Replace with function body.


func _on_player_enter(body):
	if (body.get_name() == "Player"):
		player_position = body.get_global_position()
		player_in_collission = true
		
func _on_player_exited(body):
	if (body.get_name() == "Player"):
		player_in_collission = false
		

func _process(delta):
	if player_in_collission:
		var bodu= get_overlapping_bodies()
		for i in range(0, bodu.size()):
			if (bodu[i].get_name() == "Player"):
				player_position = bodu[i].get_global_position()
		
		
	if player_in_collission == true and cooldown == true:
		cooldown = false
		get_node("Timer").start()
		var bullet_instance = Bullet.instance()
		bullet_instance.change_dir(player_position,self.get_global_position())
		get_parent().add_child(bullet_instance)
		pass
	pass


func _on_Timer_timeout():
	cooldown = true
	pass # Replace with function body.
