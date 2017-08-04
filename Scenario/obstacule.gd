extends Area

func _ready():
	pass
	
func _on_Obstacule_body_entered( body ):
	print(body)
	if( body.is_in_group("player")):
		body.die() # replace with function body
