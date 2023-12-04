extends CharacterBody2D

var health = 100
var died = false
func hit():
	print("Car Hit")
	var tween = create_tween()
	tween.tween_property($Sprite2D,"modulate", Color(1,0,0), 0.2)
	tween.tween_property($Sprite2D, "modulate", Color(1,1,1), 0.2)
	var tween2 = create_tween()
	tween2.tween_property($Turret/Sprite,"modulate", Color(1,0,0), 0.2)
	tween2.tween_property($Turret/Sprite, "modulate", Color(1,1,1), 0.2)

	health -= 10
	if health <= 0:
		if not died:
			Globals.killed +=1
			died = true

		$"../Explode".play("explode")
		
