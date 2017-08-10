extends Node

#Camera Variables
var camera = null
var position_camera = null
var limit_repeater_floor = 50
var limit_repeater_obstacule = 30
var start_pos = 0
var difference = 0

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

	for i in range(0, get_child_count()):
#    	get_parent().get_child(i).queue_free()
    	print( get_parent().get_parent() )
	start_pos = camera.get_transform().origin.z
	
#The camera moves in relation at the traslation of the camera, this involves the creation of the scenario too.
func _process(delta):
	position_camera = camera.get_transform().origin
	print( abs( ( start_pos - round(position_camera.z)) ) )
	difference =  abs( ( start_pos - round(position_camera.z)) )
	
	if ( difference == limit_repeater_obstacule):
		start_pos = round(position_camera.z)
		repeater_obstacule()
	elif (difference == limit_repeater_floor):
		repeater_floor()
	
func repeater_obstacule():
	next_position_obstacule.z += 50
	osbtacule_flappy(next_position_obstacule)
	
func repeater_floor():
	next_position_floor.z += 50
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