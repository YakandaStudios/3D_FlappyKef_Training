extends Camera

export(NodePath) var character_path
var node_character

func _ready():
	node_character = get_node(character_path)
	set_fixed_process(true)

func _process(delta):
	var target_position = node_character.get_transform().origin
	var camera_position = get_transform().origin

	camera_position.z =  target_position.z
	set_translation(camera_position)
