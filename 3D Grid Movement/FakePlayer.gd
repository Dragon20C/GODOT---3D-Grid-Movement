extends KinematicBody

var speed = 5
var current_dir = Vector3()
var next_pos = Vector3()
var destination = Vector3()
var up = Vector3.ZERO
var down = Vector3.BACK
var left = Vector3.LEFT
var right = Vector3.RIGHT
var can_move = false

func _ready():
	current_dir = up
	next_pos = Vector3.FORWARD
	destination = translation

func _physics_process(delta):
	move(delta)
	
func move(time):
	translation = translation.move_toward(destination,speed * time)
	
	if Input.is_action_just_pressed("up"):
		next_pos = Vector3.FORWARD
		current_dir = up
		can_move = true
	if Input.is_action_just_pressed("down"):
		next_pos = Vector3.BACK
		current_dir = down
		can_move = true
	if Input.is_action_just_pressed("left"):
		next_pos = Vector3.LEFT
		current_dir = left
		can_move = true
	if Input.is_action_just_pressed("right"):
		next_pos = Vector3.RIGHT
		current_dir = right
		can_move = true
	if translation.distance_to(destination) <= 0.0000:
		if can_move:
			destination = translation + next_pos
			can_move = false
