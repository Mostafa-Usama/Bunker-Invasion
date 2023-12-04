extends CharacterBody2D

var alerted = false
var attack = false
var speed = 300
var health = 30
var died = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var dir :Vector2 = (Globals.playerPos - position).normalized()
	velocity = dir * speed
	if alerted:
		look_at(Globals.playerPos)
		move_and_slide()
	if attack:
		pass

func hit():
	var tween = create_tween()
	tween.tween_property($"AnimatedSprite2D", "modulate", Color(1,0,0), 0.2)
	tween.tween_property($"AnimatedSprite2D", "modulate", Color(1,1,1), 0.2)
	$hitParticles.emitting = true
	$hit.play() 
	health -= 10
	if health <= 0:
		if not died:
			Globals.killed +=1
			died = true
		print(Globals.killed)
		$AnimatedSprite2D.stop()
		
		alerted = false
		velocity = Vector2.ZERO
		$hitParticles.emitting = true 
		await get_tree().create_timer(0.5).timeout
		queue_free()


func _on_alert_area_body_entered(body):
	alerted = true
	$AnimatedSprite2D.play("walk")
	
func _on_attack_area_body_entered(body):
	attack = true
	$AnimatedSprite2D.play("attack")
	body.hit()
	
func _on_attack_area_body_exited(body):
	attack = false
	print(alerted)
	
func _on_alert_area_body_exited(body):
	
	alerted = false
	$AnimatedSprite2D.stop()


func _on_animated_sprite_2d_animation_finished():

	if attack:
		Globals.playerHealth -= 10
		$attack.play()
		$attackCD.start()
	else:
		$AnimatedSprite2D.play("walk")
		
func _on_attack_cd_timeout():
	$AnimatedSprite2D.play("attack")
