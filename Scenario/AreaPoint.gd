extends Area

var score = 0
signal puntoNuevo(puntaje)
var puntaje = null

func _ready():
	puntaje = get_node("../../../HUD")

func _on_punto_body_entered( body ):
	if( body.is_in_group("player")):
		score+=1
		puntaje.set_text(str(score))
