extends AnimatedSprite

func _process(delta):
	if Input.is_action_pressed("Jump") and Input.is_action_pressed("Left") and Input.is_action_pressed("Right"):
		$AnimatedSprite.play("nails")
	if Input.is_action_pressed("fire"):
		$AnimatedSprite.play("magnet")
	if Input.is_action_pressed("-gravity"):
		get_tree().change_scene("res://Level 1.tscn") 
