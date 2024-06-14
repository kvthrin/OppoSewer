extends Label

var timerStarted = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timerStarted == true:
		set_text(str([snapped(Radioactrack.currentRadio,0.01),100].min()) + "%")


func _on_beginn_timer_body_entered(body):
	if body == %Opossum:
		timerStarted = true
		$"..".visible = true
