extends Node

var bus_idx = AudioServer.get_bus_index("Background")
var effect = AudioServer.get_bus_effect(bus_idx, 0)
var effect2 = AudioServer.get_bus_effect(bus_idx, 1)
# Called when the node enters the scene tree for the first time.
func _ready():
	effect.set_drive(0)
	effect2.set_drive(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Radioactrack.currentRadio != 0):
		effect.set_drive(Radioactrack.currentRadio * 0.007)
		effect2.set_drive(Radioactrack.currentRadio * 0.004)
	else:
		effect.set_drive(0)
		effect2.set_drive(0)
