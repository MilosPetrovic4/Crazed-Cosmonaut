extends KinematicBody2D

var speed = 220
var screensize
var startposx = 200
var startposy = 200

const gravity = 20
const maxFallSpeed =  200
const UPvector = Vector2(0, -1)
const jump = 1000

#Vector used for player
var movement = Vector2.ZERO

func _ready():
	screensize = get_viewport_rect().size 
	#position = Vector2(startposx, startposy)


func _physics_process(delta):
	
	movement.y += gravity
	#if movement.y > maxFallSpeed:
	#	movement.y = maxFallSpeed
	
	#Player controls
	if Input.is_action_pressed("ui_right"):
		movement.x = speed
	elif Input.is_action_pressed("ui_left"):
		movement.x = -speed
	else:
		movement.x = 0
		
		
	#if Input.is_action_pressed("ui_jump"):
	#	vector.y -= 1

	#position.x = clamp(position.x, 0, screensize.x)
	#position.y = clamp(position.y, 0, screensize.y)
		
	#sets new position of the player
	if is_on_floor():
		if Input.is_action_just_pressed("ui_jump"):
			movement.y = -jump
			
	movement = move_and_slide(movement, UPvector)
			

	
