extends Control


# Called when the node enters the scene tree for the first time.

func _ready():
	Input.set_custom_mouse_cursor(null)
#	get_node("/root/Transition").queue_free()
	get_node("/root/Music").playing = false
	Globals.killed = 0
	Globals.lasserAmmo = 20
	Globals.grenadeAmmo = 5
	Globals.playerHealth = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():

	Transition.change_scene("res://Scenes/Levels/level2.tscn")
#	get_node("/root/Music").playing = true
#	$AudioStreamPlayer.playing = false

func _on_exit_pressed():
	get_tree().quit()


func _on_how_pressed():
	$"How to play".visible = true
	


func _on_back_pressed():
	$"How to play".visible = false
