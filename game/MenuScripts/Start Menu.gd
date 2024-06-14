extends PanelContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	if(Highscore.oldPlayerName == ""):
		visible = true
		get_tree().paused = visible
	else:
		visible = false # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	$AudioStreamPlayer.play()
	visible = not visible
	get_tree().paused = visible # Replace with function body.


func _on_name_field_text_submitted(new_text):
	$AudioStreamPlayer.play()
	visible = false
	get_tree().paused = false

func _on_button_mouse_entered():
	$AudioStreamPlayer2.play()
