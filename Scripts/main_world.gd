extends Node2D

#setting the scene
@export var scene_to_instantiate: PackedScene
 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

#when the signal emits we create the node chest and add it as a child
func _on_chest_push_player() -> void:
	var chest = scene_to_instantiate.instantiate()
	chest.set_position(get_global_mouse_position())
	add_child(chest)
