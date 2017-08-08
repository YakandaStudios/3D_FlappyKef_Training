extends Area

var count = 0 setget , _get_count
var HUD = null


func increment():
    set('count', count+1)

func _get_count():
	return count
	
func _ready():
	HUD = get_node("../../../HUD")
	count=int(count)

func _on_punto_body_entered( body ):
	if( body.is_in_group("player")):
		increment()
		HUD.set_text(str(_get_count()))