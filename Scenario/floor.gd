extends StaticBody

var camera = null
var floor_scene = load("res://Scenario/Floor.tscn") 
var new_floor = null
var position_camera = null
var limit_repeater = 50
var timer = null

func _ready():
	camera = get_node("../../Camera")
	
func _process(delta):
	position_camera = camera.get_transform().origin

	
	if( (fmod( round(abs(position_camera.z)), limit_repeater ) )  == 0):
		repeat_floor()
		
func repeat_floor():
	print("repeater")
#	new_floor =  floor_scene.instance()
#	add_child(new_floor)
#	new_floor.set_transalation(0,0,146)

	
	
