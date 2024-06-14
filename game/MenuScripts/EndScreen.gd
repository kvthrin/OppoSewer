extends PanelContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_end_of_level_area_entered(area):
	visible = true
	get_tree().paused = true


func _on_button_mouse_entered():
	$AudioStreamPlayer.play()


func _on_button_2_mouse_entered():
	$AudioStreamPlayer.play()
