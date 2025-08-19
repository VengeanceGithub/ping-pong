extends CharacterBody2D

var speed = 500
var min_y = 50  # Minimum Y position (adjust to your screen)
var max_y = 550 # Maximum Y position (adjust to your screen)

func _physics_process(delta):
	# Get input (W/S or Up/Down)
	var input = Input.get_axis("p2_up", "p2_down")
	
	# Only move vertically
	velocity = Vector2(0, input * speed)
	move_and_slide()
	
	# Lock X position completely
	position.x = 1050  # Your desired X position (left paddle)
	# For right paddle use: position.x = 900 (example)
	
