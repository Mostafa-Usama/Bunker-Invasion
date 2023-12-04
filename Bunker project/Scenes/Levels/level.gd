extends Node2D
class_name levelParent
# Called when the node enters the scene tree for the first time.
var laserScene: PackedScene = preload("res://Scenes/projectiles/laser.tscn")
var greandeScene = preload("res://Scenes/projectiles/grenade.tscn")
var cursor = load("res://graphics/ui/crosshair159.png")

func _ready():
	get_node("/root/Music").playing = true
	Input.set_custom_mouse_cursor(cursor)
	for enemy in get_tree().get_nodes_in_group("Scouts"):
		enemy.connect("laser",_on_scout_laser)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Globals.playerHealth <= 0:
		$UI/Overlay.visible = true
		$"UI/Game Over".visible = true
		$"UI/Main Menu".visible = true
	
	

func _on_resume_pressed():
	pass
func _on_scout_laser(pos, dir):

	var laser = laserScene.instantiate() as Area2D
	laser.modulate = Color(1, 0.0, 0.1)
	laser.position = pos
	laser.rotation = dir.angle()
	laser.direction = dir
	$"Projectiles".add_child(laser)

func _on_player_shot(pos, dir):

	var laser = laserScene.instantiate() as Area2D
	laser.position = pos
	laser.rotation = dir.angle()
	laser.direction = dir
	$"Projectiles".add_child(laser)
			


func _on_player_throw(pos, dir):
	var grenade = greandeScene.instantiate() as RigidBody2D
	grenade.linear_velocity = dir * 1200
	grenade.position = pos
	
	$Projectiles.add_child(grenade)





