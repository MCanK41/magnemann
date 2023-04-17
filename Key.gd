extends Sprite

var a = false

func _on_Area2D_body_entered(body):
	if body.name == "Magneman":
		a = true
		queue_free()



func _on_door_body_entered(body):
	if body.name=="Magneman":
		if a:
			get_tree().change_scene("res://levels.tscn") 
