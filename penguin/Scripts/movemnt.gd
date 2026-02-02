extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const TERMINAL_VELOCITY = sqrt(((2.0*5.0*9.81)/(1.225*0.1*0.8)))
var acceleration = 15.0


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
	
	if direction.z > 0 :
		forward == 0
	elif direction.z < 0 :
		forward == -2
	else:
		acceleration == 15.0
		
	var goTo = TERMINAL_VELOCITY * forward
	if velocity.z < TERMINAL_VELOCITY:
		velocity = velocity.move_toward(Vector3(direction.x * 7.5,0,goTo), acceleration * 2)

	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
