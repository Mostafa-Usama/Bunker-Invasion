extends CharacterBody2D

var playerAround = false
var canShoot= true
var counter = 0
signal laser(pos, dir)
var health = 50
var died = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pos: Vector2
	if playerAround:
		look_at(Globals.playerPos)
#		print("AtTACK")
		if canShoot:
			if counter % 2 == 0:
				pos =  $AttackPos/Marker2D.global_position
				$AttackPos/Marker2D2/GPUParticles2D.emitting = true
			else:
				pos =  $AttackPos/Marker2D2.global_position
				$AttackPos/Marker2D/GPUParticles2D.emitting = true
			counter += 1
			var dir :Vector2 = (Globals.playerPos - position).normalized()
			laser.emit(pos, dir)
			canShoot = false
			$"shootCD".start()
	

func hit():
	
	health -= 10
	$hit.play()
	if health <= 0:
		if not died:
			died = true
			Globals.killed +=1
		playerAround = false
		$AnimationPlayer.play("new_animation")
	var tween = create_tween()
	tween.tween_property($Sprite2D, "modulate", Color(1,0,0), 0.2)
	tween.tween_property($Sprite2D, "modulate", Color(1,1,1), 0.2)
	
	
func _on_attack_area_body_entered(body):
	playerAround = true


func _on_attack_area_body_exited(body):
	playerAround = false


func _on_shoot_cd_timeout():
	canShoot = true
