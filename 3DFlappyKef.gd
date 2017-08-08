extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	for i in range(0, get_child_count()):
		get_child(i).queue_free()
	pass
