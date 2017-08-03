extends KinematicBody

export(float) var hor_speed = 10
export(int) var jump_speed = 2
export(float) var g = -2
var dead = false;
var active = true;
export(Vector3) var dir = Vector3();

func die():
	queue_free()

func _ready():
	set_process(true)
	pass
		
func _process(delta):
	
	
	dir.y += delta*(-1.5)
	dir.z = hor_speed
	
	if Input.is_action_just_pressed("ui_jump"):
		dir.y = 0.5
	
	move(dir)	
	

	
