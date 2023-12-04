extends Area2D


var rotation_speed = 5
var types = ["laser","laser" ,"health", "grenade"]
var type = types.pick_random()

# Called when the node enters the scene tree for the first time.
func _ready():
	if type == "laser":
		$Sprite2D.modulate =Color(0.1, 0.2, 0.5)
	elif type == "grenade":
		$Sprite2D.modulate =Color(0.6, 0.2, 0.1)
	else:
		$Sprite2D.modulate = Color(0.1, 0.5, 0.2)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation += rotation_speed * delta


func _on_body_entered(_body):
	if type == "laser":
		Globals.lasserAmmo += 10

	elif type == "grenade":
		Globals.grenadeAmmo += 3


	else:
		Globals.playerHealth += 10
		if Globals.playerHealth > 100:
			Globals.playerHealth = 100
	$AudioStreamPlayer2D.play()
	$Sprite2D.hide()
	$PointLight2D.hide()
	await $AudioStreamPlayer2D.finished
	queue_free()
