extends RichTextLabel

var pc = 1.0 / text.length()
var isRunning = false


func _on_timer_timeout():
	visible_ratio += pc
	if visible_ratio >= 1.0:
		$"../AudioStreamPlayer".stop()
		$Timer.stop()
		await(get_tree().create_timer(1).timeout)
		var tween = get_tree().create_tween()
		tween.tween_property(self,"modulate",Color(1,1,1,0), 1.0)
		tween.tween_callback(self.queue_free)
		$Timer.queue_free()
	elif visible_ratio < 1.0:
		if(!$"../AudioStreamPlayer".playing):
			$"../AudioStreamPlayer".play()	



func _on_acidont_body_entered(body):
	if body == %Opossum:
		if isRunning == false:
			$Timer.start()
			isRunning =  true

