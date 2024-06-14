extends Area3D


func _process(delta):
	if monitoring and %Opossum in get_overlapping_bodies():
		area_entered.emit()
		
