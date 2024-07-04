extends Area2D


enum {Deco_1, Deco_2, Deco_3}
var decoration_number : int = 0

var mysprite : Texture2D
# Called when the node enters the scene tree for the first time.
func _ready():
	mysprite = get_node("Sprite2D").texture
	pass # Replace with function body.
	
func _input_event(viewport, event, _shape_idx):
	if Input.is_action_pressed("Mouse_Clicked"):
		_Clone_Current_Sprite()
		pass

func _Clone_Current_Sprite():
	# We will use the current sprite to create a new gameobject that uses the same sprite texture as the one selected
	get_parent().get_node("CursorSprite").set_cursor_sprite(mysprite)
	pass
