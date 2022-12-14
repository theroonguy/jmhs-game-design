# built from the Rigid Body system, which automatically gives the Player node gravity.
extends RigidBody2D

# '@export' makes the variable accessible from the Inspector--the info on the right when you click on the Player node
@export var FLAP_FORCE = -400

# godot 4 uses radians for rotation, so we convert the degrees to radians using deg_to_rad() (there's probably a better way of doing this)
const MAX_ROTATION = deg_to_rad(-30.0)

func _physics_process(_delta):						# _physics_process() is a built-in function for the rigid body's physics
	if Input.is_action_just_pressed("flap"):		# 'flap' is a custom input set in Project>Project Settings>Input Map
		if global.game_started == false:			# 'global' is an autoloaded script, 'game_started' is a global variable
			global.start_game()						# global function that will trigger when game is started
			gravity_scale = 1						# enables the player gravity
		flap()										# runs the custom function below
	
	# limits angular velocity at the MAX_ROTATION value
	if rotation <= MAX_ROTATION:
		angular_velocity = 0
		rotation = MAX_ROTATION
	
	# gives the bird a downwards angular velocity until it is facing straight down
	if linear_velocity.y > 0:
		if rotation <= deg_to_rad(90):
			angular_velocity = 3
		else: 
			angular_velocity = 0

func flap():
	linear_velocity.y = FLAP_FORCE
	angular_velocity = -8.0


func _on_body_entered(body):
	print("hit")
	print(get_parent())
	get_parent().get_parent().restartGame()
	#if get_parent().get_path().get_name() == "level":
		
	
