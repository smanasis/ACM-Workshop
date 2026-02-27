extends CharacterBody2D

@export var speed:float = 100.0
@onready var animation_handle = $AnimationPlayer
var gravity = 340
var last_direction:Vector2

func _ready() -> void:
	pass



func _physics_process(_delta: float) -> void:
	
	#var direction:Vector2 = Vector2.ZERO
	var direction:Vector2 = Vector2(0, 0)
	
	
	#First way of direction with no normalization
	#Set the direction based on the input. The function normalize the Vector on its own
	#var direction = Input.get_vector("left", "right", "up", "down")
	
	
	#Second way by manual
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")
	
	
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		last_direction = direction
	
	
	velocity = direction * speed  #Ad velocity is the speed of an entity in a given direction
	#explanation of delta time
	#https://kidscancode.org/godot_recipes/4.x/basics/understanding_delta/index.html
	
	
	#to add gravity on a platformer
	#if !is_on_floor():
	#	velocity.y += gravity
	
	
	animation(direction)
	
	move_and_slide()
	 
	




func animation(direction:Vector2):
	
	if direction.x != 0:
		if direction.x > 0:
			animation_handle.play("idle_right")
			last_direction = direction
		else:
			animation_handle.play("idle_left")
			last_direction = direction

	else:
		if last_direction.x > 0:
			animation_handle.play("idle_right")
		else:
			animation_handle.play("idle_left")
	


func _on_chest_push_player() -> void:
	global_position.y += 50
