extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func Clear_toppings():
	for idx in self.get_child_count():
		if self.get_child_count() > 0:
			self.get_child(idx).queue_free()



func _on_customer_order_clear_toppings():
	Clear_toppings()
	pass # Replace with function body.
