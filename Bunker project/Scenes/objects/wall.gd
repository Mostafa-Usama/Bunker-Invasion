extends StaticBody2D

signal player_entered(body)
signal player_left(body)
func _on_area_2d_body_entered(body):
	player_entered.emit(body)


func _on_area_2d_body_exited(body):
	player_left.emit(body)
