extends Area3D

@onready var animation_player = $AnimationPlayer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if monitoring and %Opossum in get_overlapping_bodies():
		area_entered.emit(self)
		collect(%Opossum.global_position)
	if(!animation_player.is_playing()):
		if(self == %jumpJuice ):
			animation_player.play("JumpApple")

	
func collect(pos):
	print("powerup gained")
	monitoring = false
	
	$AudioStreamPlayer.play()
	
	var tween = get_tree().create_tween()
	tween.set_trans(Tween.TRANS_EXPO)
	tween.set_ease(Tween.EASE_OUT)
	
	tween.set_parallel(true)
	tween.tween_property(self,"position", self.position + Vector3(0,-100, 0), 0.5)
	tween.tween_property(self,"scale", Vector3(0.01,0.01,0.01), 0.5)
	tween.tween_property(self, "rotation", Vector3(-10,0,0), 0.5)
	
	tween.set_parallel(false)
	tween.tween_callback(self.queue_free)
