extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _input_event(viewport, event, shape_idx):
    if event is InputEventMouseButton \
    and event.button_index == BUTTON_LEFT \
    and event.is_pressed():
        self.on_click()

func on_click():
    get_tree().quit()