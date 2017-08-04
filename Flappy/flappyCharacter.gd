extends KinematicBody

export(float)  var hor_speed = 0.1
export(float) var gravity = -9.8
var dir = Vector3()

func die():
	get_tree().set_pause(true)
	#queue_free()

func _ready():
	set_process(true)
	pass
		
func _process(delta):	
	dir.y += delta*gravity
	dir.z = hor_speed

	if Input.is_action_just_pressed("ui_jump"):
		dir.y = 0.5
	
	move(dir)