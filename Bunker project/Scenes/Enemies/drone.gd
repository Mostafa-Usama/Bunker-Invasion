extends CharacterBody2D

var speed = 600
var alerted = false
var health = 20
var died = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if alerted:
		look_at(Globals.playerPos)
		var dir :Vector2 = (Globals.playerPos - position).normalized()
		velocity = dir * speed
		var collided = move_and_collide(velocity * delta)
		if collided:
			print("explode")
			alerted = false
			$DamgeArea/CollisionShape2D.disabled = false
			$AnimationPlayer.play("Explode")
func hit():
	var tween = create_tween()
	tween.tween_property($"Sprite2D", "modulate", Color(1,0,0), 0.2)
	tween.tween_property($"Sprite2D", "modulate", Color(1,1,1), 0.2)
	health -= 10
	if health <= 0:
		if not died:
			print("died")
			Globals.killed +=1
			died = true
		alerted = false
		$AnimationPlayer.play("Explode")
		

func _on_alert_area_body_entered(body):
	alerted = true


func _on_damge_area_body_entered(body):
	if body.has_method("hit"):
		body.hit()
		body.hit()
		body.hit()
