extends LineEdit

var dummyNames = ["Otto Opossum", "Ollie the Opossum", "Possum Pal Pete", "Grinny McSnout", "Furry Trash Collector", 
"Hissy Fit", "Pogo the Possum", "Dr. Pouchington", "Miss Fuzzy Tail", "Wiggly Whiskers", "Playdead Pete", "O.P.Ossum"]
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	grab_focus() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		setName()


func _on_button_pressed():
	setName()

func setName():
	select_all()
	if get_selected_text() != "":
		Highscore.playerName = get_selected_text()
	else:
		var op_nr = rng.randi_range(0,11)
		Highscore.playerName = dummyNames[op_nr]
