extends VBoxContainer

var hs = Highscore

@export var calledFromAbove = false

var floatTime

func calculatePlacement():
	print("calculating")
	if (floatTime >= hs.first):
		print("First")
		setFirst()
		hs.first = floatTime
	elif (floatTime < hs.first && floatTime >= hs.second):
		print("second")
		setSecond()
		hs.second = floatTime
	elif(floatTime < hs.second && floatTime >= hs.third):
		setThird()
		hs.third = floatTime
	elif(floatTime < hs.third && floatTime >= hs.forth):
		setFourth()
		hs.forth = floatTime
	elif(floatTime < hs.forth && floatTime >= hs.fifth):
		setFifth()
		hs.fifth = floatTime
	else:
		print("Error placing")	


func _on_end_screen_visibility_changed():
		print("Area entered")
		hs.time = $"../../../Countdown".getStringTime()   #setting time var so it can be used in the setting methods
		print(hs.time)
		floatTime = float($"../../../Countdown".getFloatTime()) #gettint float variable so comparison is possible
		print(floatTime)
		calculatePlacement()



#Methods to set Placement
func setFirst():
	print("setFirst")
	$first.set_text("1. " + "Player: " + hs.playerName + " Time remaining: " + hs.time  ) #sets label
	calledFromAbove = true #Since order effects every following placement, all has to be reordered again :(
	setSecond() #Starts reordering

func setSecond():
	print("setSecond")
	if !calledFromAbove: #For situation, where player simply got placed 2nd and this is not part of a reordering chain
		$first.set_text("1. " + "Player: " + hs.firstOldName + " Time remaining: " + hs.firstOldTime  )
		$second.set_text("2. " + "Player: " + hs.playerName + " Time remaining: " + hs.time  )	
		calledFromAbove = true
		setThird() 
		hs.secondOldName = hs.playerName
		hs.secondOldTime = hs.time
	else:
		print("Error")
		$second.set_text("2. " + "Player: " + hs.firstOldName + " Time remaining: " + hs.firstOldTime  )
		setThird() 
		hs.firstOldName = hs.playerName
		hs.firstOldTime = hs.time
	
	
func setThird():
	print("setThird")
	if !calledFromAbove:
		$first.set_text("1. " + "Player: " + hs.firstOldName + " Time remaining: " + hs.firstOldTime  )
		$second.set_text("2. " + "Player: " + hs.secondOldName + " Time remaining: " + hs.secondOldTime )	
		$third.set_text("3. " + "Player: " + hs.playerName + " Time remaining: " + hs.time  )
		calledFromAbove = true
		setFourth()
		hs.thirdOldName = hs.playerName
		hs.thirdOldTime = hs.time
	else:
		$third.set_text("3. " + "Player: " + hs.secondOldName + " Time remaining: " + hs.secondOldTime  )
		setFourth()
		hs.secondOldName = hs.firstOldName
		hs.secondOldTime = hs.firstOldTime

func setFourth():
	print("setFourth")
	if !calledFromAbove:
		$first.set_text("1. " + "Player: " + hs.firstOldName + " Time remaining: " + hs.firstOldTime  )
		$second.set_text("2. " + "Player: " + hs.secondOldName + " Time remaining: " + hs.secondOldTime  )	
		$third.set_text("3. " + "Player: " + hs.thirdOldName + " Time remaining: " + hs.thirdOldTime  )
		$fourth.set_text("4. " + "Player: " + hs.playerName + " Time remaining: " + hs.time  )
		calledFromAbove = true
		setFifth()
		hs.forthOldName = hs.playerName
		hs.forthOldTime = hs.time
	else:
		$fourth.set_text("4. " + "Player: " + hs.thirdOldName + " Time remaining: " + hs.thirdOldTime  )
		setFifth()
		hs.thirdOldName = hs.secondOldName
		hs.thirdOldTime = hs.secondOldTime
		
func setFifth():
	print("setFifth")
	if !calledFromAbove:
		$first.set_text("1. " + "Player: " + hs.firstOldName + " Time remaining: " + hs.firstOldTime  )
		$second.set_text("2. " + "Player: " + hs.secondOldName + " Time remaining: " + hs.secondOldTime  )	
		$third.set_text("3. " + "Player: " + hs.thirdOldName + " Time remaining: " + hs.thirdOldTime )
		$fourth.set_text("4. " + "Player: " + hs.forthOldName + " Time remaining: " + hs.forthOldTime  )
		$fifth.set_text("5. " + "Player: " + hs.playerName + " Time remaining: " + hs.time  )
		calledFromAbove = true
		hs.fifthOldName = hs.playerName
		hs.fifthOldTime = hs.time
	else:
		$fifth.set_text("5. " + "Player: " + hs.forthOldName + " Time remaining: " + hs.forthOldTime  )
		hs.forthOldName = hs.thirdOldName
		hs.forthOldTime = hs.thirdOldTime
		calledFromAbove = false
	

