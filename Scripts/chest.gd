extends StaticBody2D

signal push_player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

#premade signal on the area2d node
func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Entered")
	emit_signal("push_player") #we emit our own signal
