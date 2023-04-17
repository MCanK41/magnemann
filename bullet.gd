extends Sprite

var a = false

func _process(delta):
	if a == false:
		position.x += 10
	if a == true:
		position.x -= 10

