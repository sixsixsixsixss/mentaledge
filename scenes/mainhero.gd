extends CharacterBody2D

var cutscenemove = false
const SPEED = 300.0
const JUMP_VELOCITY = -450.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	cutscenemove = true


func _physics_process(delta):
	if not cutscenemove:
		
		# gravity.
		if not is_on_floor():
			velocity.y += gravity * delta

		# jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		var direction = Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()





func _on_cut_timer_timeout():
	cutscenemove = false
	$"cutscenesprite".visible = false
	$"Sprite2D".visible = true
