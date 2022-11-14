# we are using StaticBody2D because the object moves (via script), collides with the player, yet is not affected by the player
extends StaticBody2D

@export var move_speed = 1.0			# also set using the pipe_spawner script

func _process(delta):					# runs constantly
	position -= Vector2(move_speed, 0)	# move position with the 'move_speed' variable
	
	# once it reaches past the screen, delete the instance
	if global_position.x < 0:
		self.queue_free()