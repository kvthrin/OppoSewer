extends Control

@onready var label: = $RichTextLabel

var strIndex: = 0 : set =  set_strIndex  #triggers letter change
var strFrom: = "" : set = set_strFrom    #triggers animation

func set_strFrom(text:String)->void:
	
	strFrom = text
	label.text = ""
	var length: = strFrom.length()
	var t: = 0.17
	var time: = length * t
	tween.interpolate_property(self, strIndex, 0, length, time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

func set_strIndex(value:int)->void:
	strIndex = value
	label.text += strFrom[strIndex]
