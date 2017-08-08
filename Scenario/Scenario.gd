extends Node

#Camera Variables
var camera = null
var position_camera = null
var limit_repeater_floor = 50
var limit_repeater_obstacule = 30
var timerObstacule = null
var timerFloor = null

#New Objects variables
var next_position_obstacule = Vector3(0,0,0)
var next_position_floor = Vector3(0,0,0)
var scale_floor = Vector3(80,10,300)

#Charge scenario
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
	#timer 
	timerObstacule = Timer.new()
	timerObstacule.set_wait_time(1)
	timerObstacule.connect("timeout", self, "repeater_obstacule")
	add_child(timerObstacule) 
	#timer2
	timerFloor = Timer.new()
	timerFloor.set_wait_time(3)
	timerFloor.connect("timeout", self, "repeater_floor")
	add_child(timerFloor) 
	for i in range(0, get_child_count()):
#    	get_parent().get_child(i).queue_free()
    	print( get_parent().get_parent() )
	
#The camera moves in relation at the traslation of the camera, this involves the creation of the scenario too.
func _process(delta):

	position_camera = camera.get_transform().origin
	if( (fmod( round(abs(position_camera.z+1)), limit_repeater_obstacule ) )  == 0):
		timerObstacule.start()
	if( (fmod( round(abs(position_camera.z+1)), limit_repeater_floor ) )  == 0):
		timerFloor.start()
#	if( (fmod( round(abs(position_camera.z+1)), 100 ) )  == 0):
#		print( get_tree().get_root() 

	
func repeater_obstacule():
	next_position_obstacule.z += 15
	osbtacule_flappy(next_position_obstacule)
	
func repeater_floor():
	next_position_floor.z += 175
	floor_flappy(next_position_floor)
	
func osbtacule_flappy(z_distance):
	var scene_obstacule_instance = scene_obstacule.instance()
	scene_obstacule_instance.translate(z_distance)
	add_child(scene_obstacule_instance)
	
func floor_flappy(z_distance):
	var scene_floor_instance = scene_floor.instance()
	scene_floor_instance.translate(z_distance)
	scene_floor_instance.set_scale(scale_floor)
	add_child(scene_floor_instance)