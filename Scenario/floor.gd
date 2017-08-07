extends StaticBody

var camera = null
var position_camera = null
var limit_repeater = 50

func _ready():
	camera = get_node("../../Camera")
	
func _process(delta):
	position_camera = camera.get_transform().origin

	
	if( (fmod( round(abs(position_camera.z)), limit_repeater ) )  == 0):
		repeat_floor()
		
func repeat_floor():
	print("repeater")
