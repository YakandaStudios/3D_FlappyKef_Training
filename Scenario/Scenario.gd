#Copyright (c) 2017 Yakanda Studios | Mantra: Going to next level

#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.

extends Node

#Camera Variables
var camera = null
var position_camera = null
var limit_repeater_floor = 50
var limit_repeater_obstacule = 50
var start_position_obs = 0
var start_position_floor = 0
var array_floors = []
var array_obstacules = []
var target_delete = null
var scene_obstacule_instance = null
var scene_floor_instance = null
var limit_obstacules_in_screen = 10
var limit_floor_in_screen = 1
var quantity_obstacules = 3

#New Objects variables
var next_position_obstacule = Vector3(0,0,0)
var next_position_floor = Vector3(0,0,0)
var scale_floor = Vector3(80,10,150)

#Charge scenario
var scene_obstacule = preload("res://Scenario/Obstacules.tscn")
var scene_floor = preload("res://Scenario/Floor.tscn")

func _ready():
	
	camera = get_node("../Camera")
	
	#first objects to create a scenario
	scene_floor_instance = scene_floor.instance()
	scene_floor_instance.set_scale(scale_floor)
	array_floors.append(scene_floor_instance)
	add_child(scene_floor_instance)
	
	scene_obstacule_instance = scene_obstacule.instance()
	array_obstacules.append(scene_obstacule_instance)
	next_position_obstacule = scene_obstacule_instance.get_transform().origin
	add_child(scene_obstacule_instance)
#	
#	#first objects to create a scenario
	for i in range(3):
		scene_obstacule_instance = scene_obstacule.instance()
		array_obstacules.append(scene_obstacule_instance)
		next_position_obstacule.z  += 20
		scene_obstacule_instance.set_translation(next_position_obstacule)
		add_child(scene_obstacule_instance)

	start_position_obs = camera.get_transform().origin.z
	start_position_floor = camera.get_transform().origin.z
	
#The camera moves in relation at the traslation of the camera, this involves the creation of the scenario too.
func _process(delta):
	position_camera = camera.get_transform().origin

	if ( difference(start_position_obs, round(position_camera.z)) == limit_repeater_obstacule):
		start_position_obs = round(position_camera.z)
		repeater_obstacule(quantity_obstacules)
	elif (difference(start_position_floor, round(position_camera.z)) == limit_repeater_floor):
		start_position_floor = round(position_camera.z)
		repeater_floor()
	
#	print("Obstacules: " + str(array_obstacules.size() ) )
	if ( array_obstacules.size() > limit_obstacules_in_screen ):
#		print("Obstacules: " + str(array_obstacules.size() ) )
		target_delete = array_obstacules.front()
		target_delete.free()
		array_obstacules.pop_front()  
		 
	if( array_floors.size() > limit_floor_in_screen):
		target_delete = array_floors.front()
		target_delete.free() 
		array_floors.pop_front()
		
#you can define hoy many obstacule you want to repeat
func repeater_obstacule(quantity_obstacules):
	print(next_position_obstacule)
	for i in range(quantity_obstacules):
		next_position_obstacule.z += 20
		osbtacule_flappy(next_position_obstacule)
	
func repeater_floor():
	next_position_floor.z += 50
	floor_flappy(next_position_floor)

#function of creation  object
func osbtacule_flappy(z_distance):
	scene_obstacule_instance = null
	scene_obstacule_instance = scene_obstacule.instance()
	scene_obstacule_instance.set_translation(z_distance)
	array_obstacules.append(scene_obstacule_instance)
	add_child(scene_obstacule_instance)
	
func floor_flappy(z_distance):
	scene_floor_instance = null
	scene_floor_instance = scene_floor.instance()
	scene_floor_instance.set_translation(z_distance)
	scene_floor_instance.set_scale(scale_floor)
	array_floors.append(scene_floor_instance)
	add_child(scene_floor_instance)

#with this a helper function to obtain the diference of distance 
#you can use the formula of distance that you desire
func difference(first_distance, second_distance):
	var dif = abs( ( first_distance - round(second_distance)) )
	return dif