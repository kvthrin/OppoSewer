extends Node


@onready var audio = $"../AudioStreamPlayer"
var isInWater = false

func waterMoving():
	while(isInWater == true):
			if($"../OpossumModel/AnimationPlayer".current_animation == "WalkingLeft" 
			or $"../OpossumModel/AnimationPlayer".current_animation == "WalkingRight") and $"../../GameOver".visible == false :
				if(!audio.playing):
					audio.play()
			else:
				if(audio.playing):
					audio.stop()
			await(get_tree().process_frame)



func _on_acid_lakes_body_entered(body):

	if body == %Opossum:
		$"../AudioStreamPlayer3".play()
		isInWater = true
		waterMoving()

func _on_acid_lakes_body_exited(body):
	if body == %Opossum:
		isInWater = false
		audio.stop()


func _on_endlake_body_entered(body):
		if body == %Opossum:
			$"../AudioStreamPlayer3".play()
			isInWater = true
			waterMoving()


func _on_endlake_body_exited(body):
	if body == %Opossum:
		isInWater = false
		audio.stop()
