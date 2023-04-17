extends KinematicBody2D

onready var bullet = preload("res://bullet.tscn") 
var state = 700
var velocity = Vector2(0,0)
const SPEED = 350
var GRAVITY = 45
const JUMPFORCE = -900
var b
var a = false
var c = false

func _physics_process(_delta):
	shoot()
	if Input.is_action_pressed("Right"):
		velocity.x = SPEED
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("walk")
		a = false
	
	elif Input.is_action_pressed("Left"):
		velocity.x = -SPEED
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("walk")
		a = true
	else:
		$AnimatedSprite.play("default")
	
	if not is_on_floor():
		$AnimatedSprite.play("jump")
	
	if Input.is_action_just_pressed("-gravity"):
		if GRAVITY ==45:
			GRAVITY = -45
			_on_Timer_timeout()
		elif GRAVITY == -45:
			GRAVITY = 45
	velocity.y = velocity.y +GRAVITY
	
	
	if Input.is_action_just_pressed("Jump") and .is_on_floor():
		velocity.y = JUMPFORCE
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.2)

func get_direction() -> Vector2:
	if state == state.PAUSE:
		return Vector2.ZERO
	return Vector2(
		Input.get_action_strength("Right") - Input.get_action_strength("Left"),
		-1.0 if Input.get_action_strength("Jump") and is_on_floor() else 0.0
	)
func shoot():
	if Input.is_action_just_pressed("fire"):
		var Scene = get_tree().get_current_scene()
		Scene.name = "benzersiz"
		b = bullet.instance()
		Scene.add_child(b)
		b.global_position = global_position
		b.a = a

func _process(delta):
	$CanvasLayer/Label.text=str(Global.coin)
	$CanvasLayer/Label2.text=str(Global.nails)
	


func _on_Timer_timeout():
	$CanvasLayer/ProgressBar.value -=10
	
