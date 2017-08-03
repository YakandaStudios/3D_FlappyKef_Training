extends Area

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_obstacule_1_body_entered( body ):
	if( body.is_in_group("player")):
		body.die()
	pass # replace with function body
