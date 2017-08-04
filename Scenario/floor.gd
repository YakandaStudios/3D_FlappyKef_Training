extends StaticBody

var camera = null
var floor_scene = load("res://Scenario/Floor.tscn") 
var new_floor = null
var position_camera = null

func _ready():
	camera = get_node("../../Camera")
	
func _process(delta):
	position_camera = camera.get_transform().origin
	if(position_camera.z == 0):
		repeat_floor()
		
func repeat_floor():
	new_floor =  floor_scene.instance()
	add_child(new_floor)
	new_floor.set_transalation(0,0,146)

	
	
