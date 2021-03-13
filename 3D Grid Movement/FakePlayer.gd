extends KinematicBody

var speed = 5
var angle_speed = 10
var current_dir = Vector3()
var next_pos = Vector3()
var destination = Vector3()
var can_move = false
onready var collision_node = get_node("/root/World")
onready var button_duration = $Timer

func _ready():
	current_dir = "up"
	next_pos = Vector3.FORWARD
	destination = translation

func _physics_process(delta):
	var position = Vector3()
	position.x = int(translation.x)
	position.z = int(translation.z)
	translation = translation.move_toward(destination,speed * delta)
	$Mesh.rotation.y = lerp_angle($Mesh.rotation.y, atan2(-next_pos.x, -next_pos.z), delta * angle_speed)
	print(position)
	if !position + Vector3.FORWARD in collision_node.collision:
		if Input.is_action_pressed("up") and button_duration.is_stopped():
			next_pos = Vector3.FORWARD
			current_dir = "up"
			can_move = true
			button_duration.start()
	if !position + Vector3.BACK in collision_node.collision:
		if Input.is_action_pressed("down") and button_duration.is_stopped():
			next_pos = Vector3.BACK
			current_dir = "down"
			can_move = true
			button_duration.start()
	if !position + Vector3.LEFT in collision_node.collision:
		if Input.is_action_pressed("left") and button_duration.is_stopped():
			next_pos = Vector3.LEFT
			current_dir = "left"
			can_move = true
			button_duration.start()
	if !position + Vector3.RIGHT in collision_node.collision:
		if Input.is_action_pressed("right") and button_duration.is_stopped():
			next_pos = Vector3.RIGHT
			current_dir = "right"
			can_move = true
			button_duration.start()
		
	if translation.distance_to(destination) <= 0.0000 and can_move:
		destination = translation + (next_pos)
		can_move = false

