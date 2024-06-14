extends CharacterBody3D


@export var SPEED = 1.0
const acc = 1
const friction = 1.5
const max_velocity = Vector3(15,15,0)

@onready var audio = $AudioStreamPlayer



@export var jump_height: float
@export var jump_time_to_peak: float
@export var jump_time_to_descent: float

@onready var jump_velocity : float = (2.0 * jump_height)/ jump_time_to_peak
@onready var jump_gravity : float = (-2.0 * jump_height)/ (jump_time_to_peak * jump_time_to_peak)
@onready var fall_gravity : float =  (-2.0 * jump_height)/ (jump_time_to_descent * jump_time_to_descent)

var bounce = 40

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	var direction = input()
	if direction.x != Vector3.ZERO.x:
		accelerate(direction)
	else:
		add_friction()
		# Add the gravity.
	if not is_on_floor():
		velocity.y += get_gravity() * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity
		$AudioStreamPlayer2.play()

	move_and_slide()
	
	
	# Animation for idle, walking and jumping
	if direction and is_on_floor():
		
		if direction.x < 0:
			if $OpossumModel/AnimationPlayer.current_animation != "WalkingLeft":
				$OpossumModel/AnimationPlayer.play("WalkingLeft")
				
				
		elif direction.x >0:
			if $OpossumModel/AnimationPlayer.current_animation != "WalkingRight":
				$OpossumModel/AnimationPlayer.play("WalkingRight")
		
		if(!$AudioStreamPlayer4.playing):
			$AudioStreamPlayer4.play()		

	elif !is_on_floor():
		if direction.x < 0:
			if $OpossumModel/AnimationPlayer.current_animation != "JumpingLeft":
				$OpossumModel/AnimationPlayer.play("JumpingLeft")
		elif direction.x >0:
			if $OpossumModel/AnimationPlayer.current_animation != "JumpingMidAir":
				$OpossumModel/AnimationPlayer.play("JumpingMidAir")
		if($AudioStreamPlayer4.playing):
			$AudioStreamPlayer4.stop()		

	else:
		if Input.is_action_just_released("ui_right") or $OpossumModel/AnimationPlayer.current_animation == "JumpingMidAir":
			if $OpossumModel/AnimationPlayer.current_animation != "Idle":
				$OpossumModel/AnimationPlayer.play("Idle")
		elif Input.is_action_just_released("ui_left") or $OpossumModel/AnimationPlayer.current_animation == "JumpingLeft":
				$OpossumModel/AnimationPlayer.play("IdleLeft") 
		if($AudioStreamPlayer4.playing):
				$AudioStreamPlayer4.stop()
				
func get_gravity() -> float:
	return jump_gravity if velocity.y > 0.0 else fall_gravity

	
func juiceUp():
	print("juice received")
	jump_velocity += 5


func _on_jump_juice_area_entered(_area):
	print("entered")
	juiceUp()
	
func input() -> Vector3:
	var input_dir = Vector3.ZERO
	input_dir.x = Input.get_axis("ui_left", "ui_right")
	input_dir = input_dir.normalized()
	return input_dir

func accelerate(direction):
	if is_on_floor():
		if abs(velocity.x) < max_velocity.x || (velocity.x > 0 && direction.x < 0) || (velocity.x < 0 && direction.x >0):
			velocity = velocity.move_toward((SPEED * direction)+ Vector3(0,velocity.y,0), acc)
		else:
			velocity = velocity.move_toward(velocity, 1)
	else:
		velocity = velocity.move_toward((SPEED * 0.6 * direction)+ Vector3(0,velocity.y,0), acc)


func add_friction():
	if is_on_floor():
		velocity = velocity.move_toward(Vector3.ZERO, friction)
	else:
		velocity = velocity.move_toward(Vector3.ZERO, friction * 0.2)


func _on_slime_bouncy_2_body_entered(body):
	if body == %Opossum:
		velocity.y = bounce
		$AudioStreamPlayer2.play()
		$AudioStreamPlayer5.play()


