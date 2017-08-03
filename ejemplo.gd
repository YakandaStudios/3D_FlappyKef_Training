extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
func _on_button_pressed():
	get_node("Label").set_text("Start!")
	get_node("Panel").hide()
func _ready():
	get_node("Button").connect("pressed",self,"_on_button_pressed")
		
	# Called every time the node is added to the scene.
	# Initialization here
	pass
