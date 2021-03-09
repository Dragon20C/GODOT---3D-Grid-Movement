extends KinematicBody



func _physics_process(delta):
	
	if Input.is_action_just_pressed("arrow_W"):
		translation.z = translation.z + 1
	elif Input.is_action_just_pressed("arrow_A"):
		translation.x = translation.x + 1
	elif Input.is_action_just_pressed("arrow_S"):
		translation.z = translation.z - 1
	elif Input.is_action_just_pressed("arrow_D"):
		translation.x = translation.x - 1
