extends KinematicBody2D

const MAX_SPEED = 500

# FORCES
const GRAVITY = 1500
const ACCEL = 1000
const FRICTION = 2000
const JUMP = 830

onready var anim = $AnimatedSprite
var velocity = Vector2.ZERO

func bounce():
	if velocity.y >= 0:
		velocity.y += -0.5*JUMP
	else:
		velocity.y = -0.5*JUMP


func _ready():
	anim.play('idle')


func _process(delta):
	if Input.is_action_pressed('ui_right'):
		if velocity.x < 0:
			velocity.x = move_toward(velocity.x, 10, FRICTION*delta)
		else:
			velocity.x = move_toward(velocity.x, MAX_SPEED, ACCEL*delta)
		anim.play('walk')
		anim.flip_h = false
	elif Input.is_action_pressed('ui_left'):
		if velocity.x > 0:
			velocity.x = move_toward(velocity.x, -10, FRICTION*delta)
		else:
			velocity.x = move_toward(velocity.x, -MAX_SPEED, ACCEL*delta)
		anim.play('walk')
		anim.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION*delta)
		anim.play('idle')
	
	if Input.is_action_just_pressed('ui_select') and is_on_floor():
		velocity.y = -JUMP
	if not is_on_floor():
		anim.play('jump')


func _physics_process(delta):
	# gravity
	velocity.y += GRAVITY * delta
	velocity = move_and_slide(velocity, Vector2.UP)
