extends CharacterBody2D

@onready var anim = get_node("sprite")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	anim.play("default")
	


func _on_textzone_body_entered(body):
	if "mainhero" in body.name:
		$"../npc1/text".visible = true
		$text1_timer.start()
		$end1_timer.start()

func _on_text_timer_timeout():
	$text.visible_characters += 1


func _on_end_1_timer_timeout():
	$text1_timer.stop()
	$text.visible_characters = -1
	$text.visible = false
	$text2.visible = true
	$text2_timer.start()
	$end2_timer.start()

func _on_text_2_timer_timeout():
	$text2.visible_characters += 1


func _on_end_2_timer_timeout():
	$text2_timer.stop()
	$text2.visible_characters = -1
	$text2.visible = false
	if $end2_timer.is_stopped():
		$text.visible = false
		$text2.visible = false
		$text1_timer.stop()
		$text2_timer.stop()
		$end1_timer.stop()
		$end2_timer.stop()


func _on_textzone_body_exited(body):
	$"../npc1/text".visible = false
	$"../npc1/text2".visible = false
	$text1_timer.stop()
	$text2_timer.stop()
	$end1_timer.stop()
	$end2_timer.stop()
