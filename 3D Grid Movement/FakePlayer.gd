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
onready var button_duration = $Timer

func _ready():
	current_dir = up
	next_pos = Vector3.FORWARD
	destination = translation

func _physics_process(delta):
	translation = translation.move_toward(destination,speed * delta)
	
	if Input.is_action_pressed("up") and button_duration.is_stopped():
		next_pos = Vector3.FORWARD
		current_dir = up
		can_move = true
		button_duration.start()
	if Input.is_action_pressed("down") and button_duration.is_stopped():
		next_pos = Vector3.BACK
		current_dir = down
		can_move = true
		button_duration.start()
	if Input.is_action_pressed("left") and button_duration.is_stopped():
		next_pos = Vector3.LEFT
		current_dir = left
		can_move = true
		button_duration.start()
	if Input.is_action_pressed("right") and button_duration.is_stopped():
		next_pos = Vector3.RIGHT
		current_dir = right
		can_move = true
		button_duration.start()
		
	if translation.distance_to(destination) <= 0.0000 and can_move:
		destination = translation + (next_pos)
		can_move = false
	print("translation :", str(translation), " destination :", destination)
