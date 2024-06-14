extends Node

var Immunity = false
var isInLake = false
var slimeTouch = false
var jumpyTouch = false


func _on_acid_lakes_body_entered(body):
	if body == %Opossum:
		if (Immunity == false):
			isInLake = true
			while(isInLake == true):
				Radioactrack.currentRadio += 3
				print("water contact: +5 " + "total: " + str(Radioactrack.currentRadio))
				await(get_tree().create_timer(1).timeout)
	
func _on_acid_lakes_body_exited(body):
	isInLake = false

func _on_endlake_body_entered(body):
	if body == %Opossum:
		if(Immunity == false):
			isInLake = true
			while(isInLake == true):
				Radioactrack.currentRadio += 20
				print("high concentration radioactivity: +20 " + "total: " + str(Radioactrack.currentRadio))
				await(get_tree().create_timer(1).timeout)
				

			
func _on_endlake_body_exited(body):
	isInLake = false


func _on_slime_touched_body_entered(body):
	if body == %Opossum:
		if(Immunity == false):
			slimeTouch = true
			while(slimeTouch == true):
				Radioactrack.currentRadio += 2
				print("bumped slime: +2" + "total: " + str(Radioactrack.currentRadio))
				await(get_tree().create_timer(1).timeout)

func _on_slime_touched_body_exited(body):
	slimeTouch = false

func _on_slime_bouncy_2_body_entered(body):
	if body == %Opossum:
		if(Immunity == false):
			jumpyTouch = true
			while(jumpyTouch == true):
				Radioactrack.currentRadio += 1
				print("bouncy remnants: +1 " + "total: " + str(Radioactrack.currentRadio))
				await(get_tree().create_timer(1).timeout)

func _on_slime_bouncy_2_body_exited(body):
	jumpyTouch = false


func _on_acidont_body_entered(body):
	Immunity = true
	if(%Acidont.monitoring == true):
		%Acidont.visible = false
		$"../../platforms/platformTrigger/Acidont/AudioStreamPlayer".play()
	%Acidont.monitoring = false


func _on_start_menu_hidden():
	pass



func _on_beginn_timer_body_entered(body):
	if body == %Opossum:
		while true:
			if Immunity == true:
				break
			await(get_tree().create_timer(1).timeout)
			Radioactrack.currentRadio += 100.00/300.00
