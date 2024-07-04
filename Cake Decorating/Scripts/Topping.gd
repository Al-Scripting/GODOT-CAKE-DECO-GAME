extends Area2D

var Cursor_node : Node2D 
var mysprite : Sprite2D 
# Called when the node enters the scene tree for the first time.
func _ready():
	mysprite = get_node("Sprite2D")
	position = get_global_mouse_position()
	Cursor_node = get_parent().get_parent().find_child("CursorSprite")
	
	mysprite.texture = Cursor_node.get_node("Sprite2D").texture
	Cursor_node.get_node("Sprite2D").texture =load("res://Sprites/Nothing Sprite2D.png")
	pass 

func _process(delta):
	if Input.is_action_just_released("Mouse_Clicked"):
			if Cursor_node.get_script().get("Trashing_Selections") == true:
				queue_free()
			pass
	
	
