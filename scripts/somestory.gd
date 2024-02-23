extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$onreadystart/AnimationPlayer.play("trans")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.get_action_strength("next_scene_butt"):
		$trans_timer.start()
		$finish_end/AnimationPlayer.play("end_trans")


#func _on_next_scene_mouse_entered():



func _on_trans_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
