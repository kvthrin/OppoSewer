extends CharacterBody3D

@onready var audio = $AudioStreamPlayer3D2


var SPEED = 3.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var facing_right = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= 15 * delta

	#play walking animation
	if SPEED < 0:
		$SlimeModel/AnimationPlayer.play("WalkingRight")
		
	if SPEED > 0:
		$SlimeModel/AnimationPlayer.play("WalkingLeft")	
	if 	audio.playing == false:
		audio.play()
	#check for collision
	if (!$EdgeDetector1.is_colliding() && is_on_floor()) || (!$EdgeDetector2.is_colliding() && is_on_floor()):
		flip()
	if SPEED == 0:
		flip()
	velocity.x = SPEED
	move_and_slide()
	
func flip():
	facing_right = !facing_right	
	scale.x = abs(scale.x)*1
	if facing_right:
		SPEED = abs(SPEED)
	else:
		SPEED = abs(SPEED)*-1
		


func _on_slime_touched_body_entered(body):
	if body == %Opossum:
		$AudioStreamPlayer2.play()

