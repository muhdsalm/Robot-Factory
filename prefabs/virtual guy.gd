extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0
var emit_particles: = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	$AnimatedSprite2D.play("idle")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and (is_on_floor()):
		velocity.y = JUMP_VELOCITY
		$Jump.play()

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	#Change the animation/direction

	#Right movement code
	if velocity.x > 0:
		if is_on_floor():
			playWalkSound()
			$AnimatedSprite2D.animation = "run"
			$RightMoveParticles.emitting = true
		$AnimatedSprite2D.flip_h = false

	#Left movement code
	if velocity.x < 0:
		if is_on_floor():
			playWalkSound()
			$AnimatedSprite2D.animation = "run"
			$LeftMoveParticles.emitting = true
		$AnimatedSprite2D.flip_h = true

	#No movement
	if velocity.x == 0 and is_on_floor():
		#Emit_particles is true if this is the first contact with the
		#floor, in which case the particles for falling on the floor
		#should be emitted. Otherwise they shouldn't be
		if emit_particles:
			playWalkSound()
			$CenterParticles.restart()
			emit_particles = false
		$AnimatedSprite2D.set_animation("idle")

	#Is in the air
	if velocity.y < 0:
		emit_particles = true
		$AnimatedSprite2D.animation = "jump"
	
func playWalkSound():
	#There's probably an inbuilt function for this, but I haven't looked.
	if !$footsteps.playing:
		$footsteps.play()
