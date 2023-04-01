extends KinematicBody2D

const GRAVITY = 900
signal damage

var velocity = Vector2.ZERO

var detects_cliffs = true
export var speed = 50
export var direction = -1
export var damaging = false

func _ready():
	$AnimatedSprite.animation = 'walk'
	$AnimatedSprite.flip_h = direction > 0
	$FloorDetector.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$FloorDetector.enabled = detects_cliffs
	$AnimatedSprite.play()
	if damaging:
		modulate.g = 0
		modulate.b = 0
		$Hitbox/CollisionShape2D.disabled = false
	else:
		$Hitbox/CollisionShape2D.disabled = true


func _physics_process(delta):
	velocity.y += delta*GRAVITY
	velocity.x = speed * direction
	velocity = move_and_slide(velocity, Vector2.UP)
	if is_on_wall() or (not $FloorDetector.is_colliding() and detects_cliffs and is_on_floor()):
		direction *= -1
		$AnimatedSprite.flip_h = direction > 0
		$FloorDetector.position.x = $CollisionShape2D.shape.get_extents().x * direction

func _on_Deathbox_body_entered(body):
	speed = 0
	$AnimatedSprite.play('dead')
	set_collision_layer_bit(2, false)
	set_collision_mask_bit(0, false)
	$Deathbox.set_collision_mask_bit(0, false)
	body.bounce()
	yield(get_tree().create_timer(2), "timeout")
	queue_free()


func _on_Hitbox_body_entered(_body):
	emit_signal("damage")
