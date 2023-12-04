extends itemContainer


func hit():
	if not opened:
		$lid.hide()
		$AudioStreamPlayer2D.play()
		var tween = create_tween()
		tween.set_parallel(true)
		for i in $itemsChildren.get_children():
			i.show()
			var target_pos = i.position + Vector2(0, distance)  
			tween.tween_property(i, "position", target_pos, 0.5 )
			tween.tween_property(i, "scale", Vector2(1, 1), 0.5 ).from(Vector2(0,0))
		opened = true
