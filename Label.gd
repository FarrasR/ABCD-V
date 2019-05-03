extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var curval = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	var lbl = get_node("Label")
	lbl.set_text(str(curval))
	
func updateval(updateval):
	curval += updateval
	var lbl = get_node("Label")
	lbl.set_text(str(curval))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
