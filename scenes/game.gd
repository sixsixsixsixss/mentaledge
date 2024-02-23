extends Node2D

@onready var cutscenean = get_node("mainhero/cutscenesprite")
var can_enter = false
var press_lever = false
@onready var glitchpart = get_node("brokenpart1/AnimatedSprite2D")
# Called when the node enters the scene tree for the first time.
func _ready():
	glitchpart.play("default")
	cutscenean.play("default")
	$"start_transition/AnimationPlayer".play("start")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.get_action_strength("dooropen") and can_enter and $"firstdoor":
		$camera.position = $secondroomcameramark.position
		$"mainhero".position = $"secondroompos".position
	if Input.get_action_strength("next") and press_lever:
		$lever/leveroff.visible = false
		$lever/leveron.visible = true
		$floor2/platform123.position = $platformmarker.position

func _on_zone_body_entered(body):
	if "mainhero" in body.name:
		get_node("firstdoor/button").visible = true
		can_enter = true


func _on_zone_body_exited(body):
	get_node("firstdoor/button").visible = false
	can_enter = false


func _on_camerazone_2_body_entered(body):
	if "mainhero" in body.name:
		$camera.position = $secondroompart2mark.position


func _on_camerazone_2_body_exited(body):
	if "mainhero" in body.name:
		$camera.position = $secondroomcameramark.position


func _on_area_2d_body_entered(body):
	press_lever = true



func _on_stop_body_entered(body):
	if "mainhero" in body.name:
		$mainhero.cutscenemove = true
		$notready.visible = true
		$brokenpart1/stiop_timer.start()


func _on_stiop_timer_timeout():
	$notready.visible = false
	$mainhero.position = $firstlobbymark.position
	$camera.position = $firstlobbycamerapos.position
	$mainhero.cutscenemove = false
