extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func change_scene(target):
	$AnimationPlayer.play("transition")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards("transition")
