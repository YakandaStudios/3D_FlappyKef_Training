extends Node

#Camera Variables
var camera = null
var position_camera = null
var limit_repeater = 50
var timer = null
var timeSolution = false

#New Objects variables
var next_position = Vector3(0,0,0)
var scale_floor = Vector3(120,10,250)

var scene_obstacule = preload("res://Scenario/Obstacules.tscn")
var scene_floor = preload("res://Scenario/Floor.tscn")

func _ready():	
	camera = get_node("../Camera")
	#first objects to create a scenario
	var scene_obstacule_instance = scene_obstacule.instance()
	add_child(scene_obstacule_instance)
	var scene_floor_instance = scene_floor.instance()
	scene_floor_instance.set_scale(scale_floor)
	add_child(scene_floor_instance)
	timer = Timer.new()
	timer.set_wait_time(3)
	timer.connect("timeout", self, "repeater")
	add_child(timer) 

	
#The camera moves in relation at the traslation of the camera, this involves the creation of the scenario too.
func _process(delta):
	position_camera = camera.get_transform().origin
	if(timeSolution == false):
		if( (fmod( round(abs(position_camera.z+1)), limit_repeater ) )  == 0):
			timer.start()

#			timeSolution = true
	
func repeater():
	next_position.z += 75

	repeat_osbtacule(next_position)
	repeat_floor(next_position)
	
func repeat_osbtacule(z_distance):
	var scene_obstacule_instance = scene_obstacule.instance()
	scene_obstacule_instance.translate(z_distance)
	add_child(scene_obstacule_instance)
	
func repeat_floor(z_distance):
	var scene_floor_instance = scene_floor.instance()
#	z_distance.x = z_distance.z
#	z_distance.z = 0
	print(z_distance)
	scene_floor_instance.translate(z_distance)
	scene_floor_instance.set_scale(scale_floor)
	add_child(scene_floor_instance)
