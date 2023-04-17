extends Sprite

func _on_Area2D_body_entered(body):
	if body.name == "Magneman":
		$Sprite.visible = false
		$Light2D.visible = false
		Global.nails +=1
		queue_free()
