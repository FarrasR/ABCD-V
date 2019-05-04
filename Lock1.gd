extends KinematicBody2D

var energyvalue = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Sprite/Label").set_text(str(energyvalue))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

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
