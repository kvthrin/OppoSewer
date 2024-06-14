extends Node


func _ready():
	get_tree().paused = false
	preload("res://gpu_particles_3d.tscn")
	preload("res://slimes.tscn")
	preload("res://opossum.tscn")
	preload("res://slimes.tscn")

	$AudioStreamPlayer.play()

func _process(delta):
	if $"Start Menu".visible == false:
		if Input.is_action_just_pressed("quick_reset"):
			quickRestart()

func _on_button_pressed():
	
	$AudioStreamPlayer3.play()
	Highscore.oldPlayerName = ""
	Radioactrack.currentRadio = 0
	
	get_tree().reload_current_scene()


func _on_button_2_pressed():
	
	$AudioStreamPlayer3.play()
	quickRestart()
#	get_tree().paused = false
	
func quickRestart():
	if (Highscore.playerName == ""):
		Highscore.playerName = "Speedy McPossum"
	Highscore.oldPlayerName = Highscore.playerName
	Radioactrack.currentRadio = 0
	get_tree().reload_current_scene()
