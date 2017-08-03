extends Area

func _ready():
	pass


func _on_obstacule_1_body_entered( body ):
	if( body.is_in_group("player")):
		body.die()
