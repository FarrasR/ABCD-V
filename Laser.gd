extends KinematicBody2D

const MOVE_SPEED = 200
var dir = Vector2(0,1)
var newangle = 0

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	move_and_slide(dir*MOVE_SPEED)
	pass

func change_dir(newdir, parentdir):
	dir=(newdir-parentdir).normalized()


func _on_killzone_colission_detected():
	killself()
	pass 
	
func killself():
	self.queue_free()