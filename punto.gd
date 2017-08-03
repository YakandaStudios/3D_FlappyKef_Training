extends Area

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var score = 0
signal puntoNuevo(puntaje)
var puntaje = null

func _ready():
	puntaje = get_node("../HUD")

	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_punto_body_entered( body ):
	if( body.is_in_group("player")):
		print("player")
		score+=1
		puntaje.set_text(str(score))
		
	
	pass # replace with function body
