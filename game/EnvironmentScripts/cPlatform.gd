extends AnimatableBody3D



func _on_animation_player_animation_finished(_anim_name):
	self.queue_free()


func _on_c_platform_trigger_body_entered(body):
	if body == %Opossum:
		$AnimationPlayer.play("PlatformDestroy")
		$AudioStreamPlayer.play()
