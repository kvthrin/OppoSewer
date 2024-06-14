extends PanelContainer




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Radioactrack.currentRadio >= Radioactrack.radiocap:
		visible = true
		get_tree().paused = true
		$AudioStreamPlayer2.play()

func _on_button_pressed():
	visible = false
	#get_tree().paused = false


func _on_button_2_pressed():
	visible = false
#	get_tree().paused = false


func _on_button_2_mouse_entered():
	$AudioStreamPlayer.play()

func _on_button_mouse_entered():
	$AudioStreamPlayer.play()
