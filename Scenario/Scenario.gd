extends Node

#Camera Variables
var camera = null
var position_camera = null
var limit_repeater = 50

#New Objects variables
var new_obstacule = null
var new_floor = null
var next_position = Vector3(0,0,5)

onready var scene_obstacule = preload("res://Scenario/Obstacules.tscn")
onready var scene_floor = preload("res://Scenario/Floor.tscn")

func _ready():
	camera = get_node("../Camera")
	#first objects to create a scenario
	var scene_obstacule_instance = scene_obstacule.instance()
	add_child(scene_obstacule_instance)
	var scene_floor_instance = scene_floor.instance()
	add_child(scene_floor_instance)
	
#The camera moves in relation at the traslation of the camera, this involves the creation of the scenario too.
func _process(delta):
	position_camera = camera.get_transform().origin
	if( (fmod( round(abs(position_camera.z)), limit_repeater ) )  == 0):
		repeat_floor()
		repeat_osbtacule()
		
func repeat_floor(z_distance):
	print("repeater")
	
func repeat_osbtacule(z_distance):
	var scene_instance = scene.instance()
	add_child(scene_instance)


#	add_child(scene_instance)
#	scenario.set_traslation(trasladar)
#	new_obstacule =  obstacules_scene.instance()
#	new_obstacule.set_translation(trasladar)
#	new_obstacule.set_pos(40,40,146)
#	scenario.add_child(new_obstacule) # add i
#	new_floor =  floor_scene.instance()
#	add_child(new_floor)
#	new_floor.set_transalation(0,0,146)
	
	
