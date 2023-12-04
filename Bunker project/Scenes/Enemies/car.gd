extends PathFollow2D

var alerted = false
var finished = true

# Called when the node enters the scene tree for the first time.
func destroyed():
	finished = false
	

func fire():
	Globals.playerHealth -= 20
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if finished:
		progress_ratio += 0.03 * delta
		if alerted:
			$CharacterBody2D/Turret.look_at(Globals.playerPos)

func _on_alert_area_body_entered(body):
	alerted = true
	$"Red Light".play("RedLight")
	
		
	
func _on_alert_area_body_exited(body):
	alerted = false
	$"Red Light".stop()
	


