extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 7.5
const TERMINAL_VELOCITY = sqrt(((2.0*5.0*9.81)/(1.225*0.1*0.8)))*10
var acceleration = 0.5


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	var forward = -1
	if Input.is_action_pressed("ui_up"):
		acceleration = .75
	elif Input.is_action_pressed("ui_down"):
		forward = 0
	else:
		forward = -1
		acceleration = 0.5
	
	
		
	var goTo = TERMINAL_VELOCITY * forward - 25.0
	velocity.z = move_toward(velocity.z, goTo, acceleration)
	velocity.x = move_toward(velocity.x, 15.0 * direction.x, acceleration)


	move_and_slide()
