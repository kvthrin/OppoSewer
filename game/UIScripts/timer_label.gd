extends Label
@onready var timer = $Timer
var minutes
var seconds
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !timer.is_stopped():
		minutes = int(timer.time_left) /60
		seconds = int(timer.time_left) % 60
		
		set_text(getStringTime())
	
	
func getFloatTime():
	if seconds < 10:
		return str(minutes) + ".0" + str(seconds)
	else:
		return str(minutes) + "." + str(seconds)

func getStringTime():
	if seconds < 10:
		return str(minutes) + ":0" + str(seconds)
	else:	
		return str(minutes) + ":" + str(seconds)


func _on_beginn_timer_body_entered(body):
	if body == %Opossum:
		$Timer.start()


func _on_timer_timeout():
	Radioactrack.currentRadio = 100
