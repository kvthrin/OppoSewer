extends Node

var isInArea = true
var fumesAreOn


func _on_fumes_trigger_body_entered(body):
	if body == %Opossum:
		while(isInArea == true):
			$AnimationPlayer.play("GasOn")
			$AudioStreamPlayer.play()
			fumesAreOn = true
			await(get_tree().create_timer(4.0).timeout)
			$AnimationPlayer.play("GasOff")
			fumesAreOn = false
			await(get_tree().create_timer(4.0).timeout)
			$FumesTrigger.monitoring = false
