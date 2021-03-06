extends KinematicBody2D

const MOVE_SPEED = 500
const JUMP_FORCE = 750
const GRAVITY = 50
const MAX_FALL_SPEED = 1000

onready var anim_player = $AnimationPlayer
onready var sprite = $Sprite

var y_velo = 0
var facing_right = false
var double_jump = false

export var initial_energy = 0

func _ready():
	var lbl = get_node("Sprite/Label")
	lbl.add_color_override("font_color", Color(1,1,1))
	lbl.set_text("0")
	var playerCamera = get_node("Player_Camera")
	playerCamera.current = true
	var EnergyVariables = get_node("/root/EnergyVariables")
	EnergyVariables.AddEnergy(initial_energy)		

func _physics_process(delta):
	if Input.is_action_just_pressed("restart_level"):
		var EnergyVariables = get_node("/root/EnergyVariables")
		EnergyVariables.RestartLevel()

	var move_dir = 0
	if Input.is_action_pressed("move_right"):
        move_dir += 1
	if Input.is_action_pressed("move_left"):
        move_dir -= 1
	move_and_slide(Vector2(move_dir*MOVE_SPEED,y_velo),Vector2(0,-1))
	
	var grounded = is_on_floor()
	
	
	var EnergyVariables = get_node("/root/EnergyVariables")
	var lbl = get_node("Sprite/Label")
	lbl.set_text(str(EnergyVariables.CurrentEnergy))
	
	y_velo += GRAVITY
	if grounded and Input.is_action_just_pressed("jump"):
		y_velo = -JUMP_FORCE
	if !grounded and Input.is_action_just_pressed("jump") and double_jump == false:
		y_velo = -JUMP_FORCE*0.75
		double_jump = true
	if grounded and y_velo >= 5:
		y_velo = 5
		double_jump = false
	if y_velo > MAX_FALL_SPEED:
		y_velo = MAX_FALL_SPEED
		
	if facing_right and move_dir < 0:
        flip()
	if !facing_right and move_dir > 0:
        flip()
	
	if grounded:
		if move_dir == 0:
			play_anim("idle")
		else:
			play_anim("walk")
	else:
		play_anim("jump")
		
		
func flip():
    facing_right = !facing_right
    sprite.flip_h = !sprite.flip_h
	
		
func play_anim(anim_name):
    if anim_player.is_playing() and anim_player.current_animation == anim_name:
        return
    anim_player.play(anim_name)
	
