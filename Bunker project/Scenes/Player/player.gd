extends CharacterBody2D

@export var speed = 400
var can_shoot = true
var can_grenade = true
signal shot(pos, dir)
signal throw(pos, dir)
var died = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Globals.playerHealth <= 0:
		died = true
		$CollisionShape2D.disabled = true
		$"player image".visible = false
	if not died:
		var direction = Input.get_vector("left", "right", "up", "down")
		look_at(get_global_mouse_position())

		velocity = direction * speed
		move_and_slide()
		Globals.playerPos = global_position
		var dir = (get_global_mouse_position() - position).normalized()
		if (Input.is_action_pressed("primary action")) and can_shoot and Globals.lasserAmmo > 0:
			Globals.lasserAmmo-= 1
			
			$"Shoting pos/GPUParticles2D".emitting = true
			can_shoot = false
			$laser_timer.start()
			shot.emit($"Shoting pos".global_position, dir)
			
			
		if (Input.is_action_pressed("secondry action")) and can_grenade and Globals.grenadeAmmo > 0:
			Globals.grenadeAmmo -= 1
			$"grenade throw".play()
			can_grenade = false
			$grenade_timer.start()
			throw.emit($"Shoting pos".global_position, dir)
		
	

func _on_laser_timer_timeout():
	can_shoot = true


func _on_grenade_timer_timeout():
	can_grenade = true


func hit():
	Globals.playerHealth -= 5
	var tween = create_tween()
	tween.tween_property($"player image", "modulate", Color(1,0,0), 0.2)
	tween.tween_property($"player image", "modulate", Color(1,1,1), 0.2)
	$AudioStreamPlayer2D.play()

