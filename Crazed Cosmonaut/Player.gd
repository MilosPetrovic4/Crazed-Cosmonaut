extends KinematicBody2D

var speed = 220
var screensize
var startposx = 200
var startposy = 200

const gravity = 20
const maxFallSpeed =  200
const UPvector = Vector2(0, -1)
const jump = 1000

var pHealth = 100;

#Vector used for player
var movement = Vector2.ZERO

func _ready():
	screensize = get_viewport_rect().size 
	$AnimatedSprite.play("default")
	#$HealthReduce.start()
	#position = Vector2(startposx, startposy)


func _physics_process(delta):
	
	movement.y += gravity
	
	#if pHealth <= 0:
		#$Player.hide()
	
	#Player controls
	if Input.is_action_pressed("ui_right"):
		movement.x = speed
		$AnimatedSprite.flip_h = false
		
	elif Input.is_action_pressed("ui_left"):
		movement.x = -speed
		$AnimatedSprite.flip_h = true
	else:
		movement.x = 0
		
	if Input.is_action_just_pressed("ui_punch"):
		
		if $AnimatedSprite.flip_h == false:
			$Area2D/punch_range_right.disabled = false
			
		if $AnimatedSprite.flip_h == true:
			$Area2D2/punch_range_left.disabled = false
			
		$AnimatedSprite.play("punch")
		$punchSound.play()
		
		
		
	if Input.is_action_just_released("ui_punch"):
		$AnimatedSprite.play("default")
		
		
		$Area2D/punch_range_right.disabled = true
		$Area2D2/punch_range_left.disabled = true
			
		
		
	#sets new position of the player
	if is_on_floor():
		if Input.is_action_just_pressed("ui_jump"):
			movement.y = -jump
			#$jumpForce.start()
			$jumpSound.play() #Sound Effect from https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=music&amp;utm_content=6462
		#if Input.is_action_just_released("ui_jump"):
		#	$jumpForce.stop()
			
	movement = move_and_slide(movement, UPvector)
			

	



func _on_Area2D_body_entered(body):
	if body.is_in_group("hit"):
		$boxBreak.play()
		body.takeDamage()


func _on_Area2D2_body_entered(body):
	if body.is_in_group("hit"):
		$boxBreak.play()
		body.takeDamage()


func _on_HealthReduce_timeout():
	pHealth -= 1
	$Camera2D/ProgressBar.value = pHealth
