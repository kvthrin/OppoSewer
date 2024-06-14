extends Node


func _on_area_1_zu_area_2_area_entered(area):
	$"../Area 1/BlackBorders/Area1".hide()
	$"../Area 2/BlackBorders/Area2".show()
	$Area1zuArea2.monitoring = false
	$"../Area 1/Lights/Area1Lights".hide()
	$"../Area 2/Walls and fluff/Area2Lights".show()
	$"../Water2".show()

func _on_area_2_zu_area_3_area_entered(area):
	$"../Area 2/BlackBorders/Area2".hide()
	$"../Area 3/BlackBorders/Area3".show()
	$Area2zuArea3.monitoring = false
	$Area3zuArea2.monitoring = true
	$"../Area 2/Walls and fluff/Area2Lights".hide()
	$"../Area 3/Walls_Light_Fluff/Area3Lights".show()
	$"../Water2".hide()
	$"../Water".show()

func _on_area_3_zu_area_2_area_entered(area):
	$"../Area 2/BlackBorders/Area2".show()
	$"../Area 3/BlackBorders/Area3".hide()
	$Area2zuArea3.monitoring = true
	$Area3zuArea2.monitoring = false
	$"../Area 2/Walls and fluff/Area2Lights".show()
	$"../Area 3/Walls_Light_Fluff/Area3Lights".hide()
	$"../Water2".show()
	$"../Water".hide()

func _on_area_3_zu_area_4_area_entered(area):
		$"../Area 3/BlackBorders/Area3".hide()
		$"../Area 4/BlackBorders/Area4".show()
		$Area4zuArea3.monitoring = true
		$Area3zuArea4.monitoring = false
		$"../Area 3/Walls_Light_Fluff/Area3Lights".hide()
		$"../Area 4/Walls_Lights_Fluff/Area4Lights".show()
		$"../Water".hide()

func _on_area_4_zu_area_3_area_entered(area):
	$"../Area 3/BlackBorders/Area3".show()
	$"../Area 4/BlackBorders/Area4".hide()
	$Area4zuArea3.monitoring = false
	$Area3zuArea4.monitoring = true
	$"../Area 3/Walls_Light_Fluff/Area3Lights".show()
	$"../Area 4/Walls_Lights_Fluff/Area4Lights".hide()
	$"../Water".show()

func _on_area_5_zu_area_6_area_entered(area):
	$"../Area6/BlackBorders/Area6".show()
	$"../Area5/BlackBorders/Area5".hide()
	$Area5zuArea6.monitoring = false
	$Area6zuArea5.monitoring = true
	$"../Area5/Walls_Light_Fluff/Area5Lights".hide()
	$"../Area6/Walls_Lights_Fluff/Area6Lights".show()
	$"../Water5".show()
	$"../Water4".show()


func _on_area_6_zu_area_5_area_entered(area):
	$"../Area6/BlackBorders/Area6".hide()
	$"../Area5/BlackBorders/Area5".show()
	$Area5zuArea6.monitoring = true
	$Area6zuArea5.monitoring = false
	$"../Area5/Walls_Light_Fluff/Area5Lights".show()
	$"../Area6/Walls_Lights_Fluff/Area6Lights".hide()
	$"../Water3".show()
	$"../Water5".hide()
	$"../Water4".hide()

func _on_area_4_zu_area_5_area_entered(area):
	$"../Area 4/BlackBorders/Area4".hide()
	$"../Area5/BlackBorders/Area5".show()
	$Area4zuArea5.monitoring = false
	$"../Area 4/Walls_Lights_Fluff/Area4Lights".hide()
	$"../Area5/Walls_Light_Fluff/Area5Lights".show()
	$"../Water3".show()

func _on_area_6_zu_area_7_area_entered(area):
	$"../Area6/BlackBorders/Area6".hide()
	$"../Area7/BlackBorders/Area7".show()
	$Area7zuArea6.monitoring = true
	$Area6zuArea7.monitoring = false
	$"../Area6/Walls_Lights_Fluff/Area6Lights".hide()
	$"../Area7/Walls_Fluff_Lights/Area7Lights".show()
	$"../Water5".hide()
	$"../Water4".hide()
	
func _on_area_7_zu_area_6_area_entered(area):
	$"../Area6/BlackBorders/Area6".show()
	$"../Area7/BlackBorders/Area7".hide()
	$Area7zuArea6.monitoring = false
	$Area6zuArea7.monitoring = true
	$"../Area6/Walls_Lights_Fluff/Area6Lights".show()
	$"../Area7/Walls_Fluff_Lights/Area7Lights".hide()
	$"../Water5".show()
	$"../Water4".show()
