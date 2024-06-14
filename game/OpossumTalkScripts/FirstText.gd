extends RichTextLabel

var pc = 1.0 / text.length()
var isRunning = false

func _process(delta):
	if isRunning == false:
		$Timer.start()
		isRunning =  true

		


func _on_timer_timeout():
	visible_ratio += pc
	if visible_ratio >= 1.0:
		$Timer.stop()
		await(get_tree().create_timer(1).timeout)
		var tween = get_tree().create_tween()
		tween.tween_property(self,"modulate",Color(1,1,1,0), 1.0)
		tween.tween_callback(self.queue_free)
		$Timer.queue_free()
		$"../AudioStreamPlayer".stop()
	elif visible_ratio < 1.0:
		if(!$"../AudioStreamPlayer".playing):
			$"../AudioStreamPlayer".play()	
