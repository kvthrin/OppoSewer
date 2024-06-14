extends Area3D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if monitoring and %Opossum in get_overlapping_bodies():
		area_entered.emit(self)
		
