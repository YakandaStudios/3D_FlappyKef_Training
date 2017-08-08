extends KinematicBody

var hor_speed = 0.2
var gravity = -2
var jump_speed = 0.5
var dir = Vector3()

func die():
	pass
#	get_tree().set_pause(true)
	#queue_free()

func _ready():
	set_process(true)
	
func _process(delta):	
	dir.y += delta*gravity
	dir.z = hor_speed

	if Input.is_action_just_pressed("ui_jump"):
		dir.y = jump_speed
	
	move(dir)