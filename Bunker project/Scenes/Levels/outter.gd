extends levelParent


# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_wall_player_entered(body):
	if Globals.killed == 28:
		var tween = create_tween()
		tween.tween_property($player, "speed", 0, .5)
		Transition.change_scene("res://Scenes/Levels/inner.tscn")
	else:
		$UI/message.visible = true
		

func _on_house_house_enter():
	var tween = get_tree().create_tween()
	tween.tween_property($player/Camera2D, "zoom", Vector2(.8, .8), 1)	


func _on_house_house_leave():
	var tween = get_tree().create_tween()
	tween.tween_property($player/Camera2D, "zoom", Vector2(.6, .6), 1)	


func _on_wall_player_left(body):
	$UI/message.visible = false
