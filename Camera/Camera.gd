extends Camera

#Character choosed to follow the camera
export(NodePath) var character_path
var node_character

#Assign the path to the node of the character
func _ready():
	node_character = get_node(character_path)	

#Movement of the camera
func _process(delta):
	var target_position = node_character.get_transform().origin
	var camera_position = get_transform().origin
	camera_position.z =  target_position.z
	set_translation(camera_position)