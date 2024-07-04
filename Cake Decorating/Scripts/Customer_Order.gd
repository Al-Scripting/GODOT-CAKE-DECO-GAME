extends Node2D

signal CLEAR_TOPPINGS

var difficulty: = 0

var Sprinkles = 0 
var R_Sprinkles = 0

var Berries = 0 
var R_Berries = 0

var Whip = 0
var R_Whip = 0

#other scores 
var points = 0 
var time = 10 
var Completion_time : float = 30 

#labels 
var Label_Sprinkle : Label 
var Label_Berry : Label 
var Label_Whip : Label 

var Label_Time : Label
var Label_Score : Label

#RNG
var R_gen = RandomNumberGenerator.new()

var pause : bool = false



# Called when the node enters the scene tree for the first time.
func _ready():
	R_gen.randomize()
	Next_Order()
	
	Label_Berry = get_node("Berries")
	Label_Sprinkle = get_node("Sprinkles")
	Label_Whip = get_node("Whip")
	
	Label_Score = get_node("Points")
	Label_Time = get_node("Time")
	
	pass # Replace with function body.


func _process(delta):
	if pause == false:
		time -= delta
	
	if time < 0: 
		time = 0
		Next_Order()
	
	Label_Berry.text ="Berry: " + str(Berries) + "/" + str( R_Berries) 
	Label_Sprinkle.text ="Sprinkles: " + str(Sprinkles) + "/" + str(R_Sprinkles)
	Label_Whip.text ="Whip: " + str(Whip) + "/" + str(R_Whip)
	
	if pause == false: 
		Label_Time.text = "Time:" + str(round(time))
	else:
		Label_Time.text = "PAUSED"
		
	Label_Score.text ="Score: " + str(points) 
	
	#pause button
	if Input.is_key_pressed(KEY_P):
		pause = true
	if Input.is_key_pressed(KEY_O):
		pause = false
	
	if Input.is_key_pressed(KEY_1):
		Completion_time = 10
		print("NORMAL MODE")
	if Input.is_key_pressed(KEY_2):
		Completion_time = 5
		print("HARD MODE")

func _Check_Cake():
	if  Berries == R_Berries and Sprinkles == R_Sprinkles and Whip == R_Whip: 
		print("Cake is Good")
		points = points + 1 
	else:
		print("Cakeisbad")
	
	emit_signal("CLEAR_TOPPINGS")
	
	Berries = 0
	Sprinkles = 0 
	Whip = 0

func _Generate_Cake_Requirements():
	R_Berries = R_gen.randi_range(0 + difficulty, 4 + difficulty)
	R_Sprinkles = R_gen.randi_range(0 + difficulty , 4 + difficulty)
	R_Whip = R_gen.randi_range(0 + difficulty, 4 + difficulty)


func Next_Order(): 
	_Check_Cake()
	time = Completion_time
	_Generate_Cake_Requirements()
	
	if points % 2 == 0:
		print("LEVEL UP")
		difficulty += 1
# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_cursor_sprite_decorate(deco_choice):
	if deco_choice == 1: 
		Sprinkles += 1
	elif deco_choice == 2:
		Berries += 1
	elif deco_choice == 3:
		Whip += 1
		 
		pass # Replace with function body.
