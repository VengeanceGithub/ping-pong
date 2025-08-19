class_name Ball 
extends CharacterBody2D
@onready var bump_sound: AudioStreamPlayer2D = $bump_sound

var speed := 400
var direction: Vector2 = Vector2(1, 0).normalized()
var maxSpeed := 800
var min_angle := PI/6  # 30 degrees, prevents too shallow angles

func _ready() -> void:
	reset_ball()

func _physics_process(delta: float) -> void:
	# Cap speed at maxSpeed without immediately overriding
	if speed > maxSpeed:
		speed = maxSpeed
	
	velocity = direction * speed
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		handle_collision(collision)

func handle_collision(collision):
	bump_sound.play()
	var normal = collision.get_normal()
	direction = direction.bounce(normal)
	
	# Ensure the ball doesn't get stuck in horizontal/vertical loops
	if abs(direction.x) < 0.1:  # Too horizontal
		direction.x = sign(direction.x) * 0.1
		direction = direction.normalized()
	if abs(direction.y) < 0.1:  # Too vertical
		direction.y = sign(direction.y) * 0.1
		direction = direction.normalized()
	
	# Increase speed but cap at max
	speed = min(speed + 10, maxSpeed)

func reset_ball():
	global_position = Vector2(640, 360)
	speed = 400
	
	# Randomize direction with better angle control
	direction.x = [-1, 1][randi() % 2]
	direction.y = randf_range(-0.5, 0.5)  # More controlled range than -0.3 to 0.3
	direction = direction.normalized()
	
	# Ensure minimum angle
	if abs(direction.x) > cos(min_angle):
		direction.x = sign(direction.x) * cos(min_angle)
		direction.y = sign(direction.y) * sin(min_angle)
		direction = direction.normalized()
