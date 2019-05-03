extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var flag = 0
var energyvalue = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Sprite/Label").set_text(str(energyvalue))# Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
#func _physics_process(delta):
	#print(str(get_node("../Player").energy))
		
#func _unhandled_input(event):
#	if event is InputEventKey:
#		if event.pressed and event.scancode == KEY_Z and flag == 1 and get_node("../Player").energy == energyvalue:
#			for child in get_children():
#				child.queue_free()
				
func unlock():
	hide()
	set_process_unhandled_input(false)
	set_process_input(false)
	get_node("CollisionShape2D").set_disabled(true)

func lock():
	print("active")
	show()
	set_process_unhandled_input(true)
	set_process_input(true)
	get_node("CollisionShape2D").set_disabled(false)
