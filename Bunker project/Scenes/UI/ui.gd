extends CanvasLayer

var green :Color = Color("6bbfa3")
var red : Color = Color(.9, 0, 0, 1)
var paused = false
var finish = false
@onready var bulletLabel =$"MarginContainer/HBoxContainer/Bullets Counter/Label"
@onready var grenadeLabel = $"MarginContainer/HBoxContainer/Grenade Counter/Label"
@onready var bulletIcon = $"MarginContainer/HBoxContainer/Bullets Counter/TextureRect"
@onready var grenadeIcon = $"MarginContainer/HBoxContainer/Grenade Counter/TextureRect"
@onready var healthBar =$"MarginContainer/Health Bar/TextureProgressBar"
# Called when the node enters the scene tree for the first time.
func _ready():
	bulletLabel.text = str(Globals.lasserAmmo)
	grenadeLabel.text = str(Globals.grenadeAmmo)
	healthBar.value = Globals.playerHealth
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	bulletLabel.text = str(Globals.lasserAmmo)
	grenadeLabel.text =str(Globals.grenadeAmmo)
	healthBar.value = Globals.playerHealth
	if Globals.lasserAmmo > 0:
		bulletIcon.modulate = green
		bulletLabel.modulate = green
	else:
		bulletIcon.modulate = red
		bulletLabel.modulate = red
		
	if Globals.grenadeAmmo > 0:
		grenadeIcon.modulate = green
		grenadeLabel.modulate = green
	else:
		grenadeIcon.modulate = red
		grenadeLabel.modulate = red

	
	if Input.is_action_just_pressed("ui_cancel"):
		$Pause.visible = not paused
		get_tree().paused = not paused
#		Engine.time_scale = 0
		paused = not paused
		
	if Globals.killed == 62 and not finish:
		$Victory.visible = true
		get_tree().paused = true
		finish = true
			
func _on_main_menu_pressed():
	get_tree().paused = false
	Transition.change_scene("res://Scenes/UI/control.tscn")


func _on_resume_pressed():
	get_tree().paused = false
	$Pause.visible = false
	paused = false
	
