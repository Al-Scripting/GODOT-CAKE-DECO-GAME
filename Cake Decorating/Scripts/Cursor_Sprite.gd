extends Node2D

signal Decorate

var deco_choice : int
var Mouse_sprite : Texture2D
var Holding_object : bool = false
var new_image : Sprite2D = Sprite2D.new()


var Topping = load("res://Objects/Topping.tscn")

var Top_1 : Texture = preload("res://Sprites/Sprinkles.png") 
var Top_2 : Texture = preload("res://Sprites/Strawberry.png") 
var Top_3 : Texture = preload("res://Sprites/whipped cream.png")


var default_sprite : Texture2D = preload("res://Sprites/Nothing Sprite.png")
# Called when the node enters the scene tree for the first time.


func _ready():
	Mouse_sprite = default_sprite
	pass # Replace with function body.

func _process(delta):
	position = get_global_mouse_position()
	if Input.is_action_just_released("Mouse_Clicked"):
		if Holding_object == true:
			
			if $Sprite2D.texture == Top_1:
				deco_choice = 1
			elif $Sprite2D.texture == Top_2:
				deco_choice = 2
			elif $Sprite2D.texture == Top_3:
				deco_choice = 3
			emit_signal("Decorate", deco_choice)
			
			get_parent().find_child("Toppings").add_child(Topping.instantiate())
			Holding_object = false
		
	pass
	

func set_cursor_sprite(sprite):
	get_node("Sprite2D").texture = sprite 
	new_image.texture = sprite
	Holding_object = true
	pass

