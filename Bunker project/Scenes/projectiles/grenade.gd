extends RigidBody2D

var isExploding = false

func explode():
	$AnimationPlayer.play("explode")
	isExploding = true
	
	
func _process(_delta):
#	if isExploding:
#		var targets = get_tree().get_nodes_in_group("Scouts")
#		for target in  targets:
#			target.hit()
	pass

func _on_explosion_radius_body_entered(body):
	if body.has_method("hit"):
		body.hit()
		body.hit()
