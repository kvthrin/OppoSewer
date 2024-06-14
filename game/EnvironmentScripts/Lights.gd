extends OmniLight3D




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(!$AudioStreamPlayer3D.playing):
		$AudioStreamPlayer3D
