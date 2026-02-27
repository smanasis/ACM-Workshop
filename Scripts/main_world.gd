extends Node2D

@export var scene_to_instantiate: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_chest_push_player() -> void:
	var chest = scene_to_instantiate.instantiate()
	add_child(chest)
