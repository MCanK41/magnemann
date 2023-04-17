extends Sprite


func _on_Area2D_body_entered(body):
	if body.name == "Magneman":
		Global.coin +=1
		queue_free()
