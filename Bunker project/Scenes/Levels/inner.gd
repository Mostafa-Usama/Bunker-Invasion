extends levelParent



func _on_exit_gate_body_entered(body):
	var tween = create_tween()
	tween.tween_property($player, "speed", 0, .5)
	Transition.change_scene("res://Scenes/Levels/level2.tscn")


