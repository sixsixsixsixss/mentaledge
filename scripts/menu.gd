extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	




func _on_play_pressed():
	$play.set_disabled(true)
	$start.start()
	$CanvasLayer/AnimationPlayer.play("fade")

func _on_start_timeout():
	get_tree().change_scene_to_file("res://scenes/somestory.tscn")

