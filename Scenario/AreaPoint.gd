extends Area

var score = 0
var HUD = null

func _ready():
	HUD = get_node("../../../HUD")

func _on_punto_body_entered( body ):
	if( body.is_in_group("player")):
		score += 1
		HUD.set_text(str(score))
