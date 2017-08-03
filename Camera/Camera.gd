extends Camera

export(NodePath) var character_path
var node_character
var smooth_camera_pos = Vector3()
var smooth_speed = 8



func _ready():
	node_character = get_node(character_path)
	set_fixed_process(true)


func _process(delta):
	var target_position = node_character.get_transform().origin
	var camera_position = get_transform().origin
	
	

	camera_position.z =  target_position.z
	#smooth_camera_pos = smooth_camera_pos.linear_interpolate(target_position, smooth_speed * delta)
	set_translation(camera_position)


	print(str(camera_position))
	pass
