extends CharacterBody2D


@export var speed:float = 100.0
@onready var animation_handle = $AnimationPlayer #before even the ready funxtion execute, we define var 
												 #animation_handle shows the path to the animationPlayer Node
												 #Now we can tweak its properties from this script
var gravity = 340 #for a platformer game 
var last_direction:Vector2             #usefulfor the animation handling

func _ready() -> void:
	pass



func _physics_process(_delta: float) -> void:
	
	#Two different ways of setting a Vector2 to zero
	#var direction:Vector2 = Vector2.ZERO
	var direction:Vector2 = Vector2(0, 0)
	
	
	#First way of direction with no normalization
	#Set the direction based on the input. The function normalize the Vector on its own
	#and returns a vector2 
	#var direction = Input.get_vector("left", "right", "up", "down")
	
	
	#Second way, normalize "manually"
	#We get the the dirrection of each axis indepentantly and we combine them 
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")
	
	#If we start moving we need to normalize, no need to normalize when we dont move
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		last_direction = direction           #getting the last direction it looked for the animation
	
	
	#Definition: Velocity is the speed of an entity in a given direction
	#That mean the velocity equals speed * direction
	velocity = direction * speed  
	#explanation of delta time
	#https://kidscancode.org/godot_recipes/4.x/basics/understanding_delta/index.html
	
	
	#to add gravity on a platformer
	#if !is_on_floor():
	#	velocity.y += gravity
	
	
	animation(direction)
	
	#A function used in _physics_proccces func, to apply the physics that we coded inside the func
	#Neccesery always use it in the end of the physics function
	move_and_slide()
	 
	



#Handiling the animation
func animation(direction:Vector2):
	
	#If moving to the right play idle right animation
	#else play idle left 
	if direction.x != 0:
		if direction.x > 0:
			animation_handle.play("idle_right")
			last_direction = direction
		else:
			animation_handle.play("idle_left")
			last_direction = direction
	#we always save the last direction the player looked 

	#if not moving now we are playing the animation based on the direction in movedthe last time
	else:
		if last_direction.x > 0:
			animation_handle.play("idle_right")
		else:
			animation_handle.play("idle_left")
	

#function that executes when the signal emits
#look at the chest.gd script
func _on_chest_push_player() -> void:
	global_position.y += 50
