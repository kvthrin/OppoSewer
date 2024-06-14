extends Node

var bus_idx = AudioServer.get_bus_index("Background")
var effect = AudioServer.get_bus_effect(bus_idx, 0)


func _process(delta):
	if (Radioactrack.currentRadio == 50):
		_ShaderEnable2()
	elif(Radioactrack.currentRadio < 100):
		_ShadersScaleUp()
	elif(Radioactrack.currentRadio == 0):
		effect.set_drive(0)

func _ShadersScaleUp():
	$CanvasLayer1/NoiseOffset.material.set("shader_parameter/strength", Radioactrack.currentRadio * 0.05)
	$CanvasLayer3/Chromatic.material.set("shader_parameter/spread", Radioactrack.currentRadio * 0.0008)
	#$CanvasLayer4/Static.material.set("shader_param/BORDER_SIZE", Radioactrack.currentRadio  / 1)
	#print($CanvasLayer3/Chromatic.material.get_shader_parameter("spread"))

func _ShaderEnable2():
	$CanvasLayer.visible = true


