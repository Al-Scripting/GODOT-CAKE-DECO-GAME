extends Area2D

var My_Collision_Box : CollisionShape2D 
var Deleting_objects : bool = false
var erasing : bool = false
var hovered_node : Area2D 




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):

	position = get_global_mouse_position()
	
	if Input.is_key_pressed(KEY_K):
		Deleting_objects = true
		print("Erasing")
	if Input.is_key_pressed(KEY_L):
		Deleting_objects = false		
		print("no longer erasing")
		
	if Input.is_action_just_pressed("Mouse_Clicked"):
		if Deleting_objects == true:
			erasing = true
	if Input.is_action_just_released("Mouse_Clicked"):
		if Deleting_objects == true:
			if hovered_node != null :
				hovered_node.queue_free()
	pass


func _on_area_entered(area):
	if area.is_in_group("Topps"):
		hovered_node = area
		print(area)
	pass # Replace with function body.


func _on_area_exited(area):
	hovered_node = null
	print("Hovered Node = Null")
	pass # Replace with function body.
