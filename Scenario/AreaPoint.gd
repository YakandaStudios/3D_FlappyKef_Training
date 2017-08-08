extends Area

var score = 0
var HUD = null

func _ready():
	HUD = get_node("../../../HUD")

func _on_AreaPoint_body_entered( body ):
	if( body.is_in_group("player") ):
		score = score + 1
		print(score)

