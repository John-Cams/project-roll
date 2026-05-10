class_name oldDice extends Node2D 

@export var outerColor:Color
@export var innerColor:Color
@export var possibleVals:Array[int] = [1,2,3,4,5,6]
@export var val:int
@export var valInd:int

@export var rolling = false

var cardMods = ["Blank","Blank","Blank","Blank","Blank","Blank"]

func _ready() -> void:
	$Border.color = outerColor
	$Inner.color = innerColor
	$Label.add_theme_color_override("font_color", innerColor.inverted())

func roll() -> void:
	if(rolling):
		return
	rolling=true
	valInd = randi_range(0,possibleVals.size()-1)
	val = possibleVals[valInd]
	$Timer.wait_time = 0.01
	$Timer.start()
	for i in range(6):
		print($Timer.wait_time)
		$Label.text =  str(possibleVals[randi_range(0,possibleVals.size()-1)])
		await $Timer.timeout
		$Timer.wait_time = $Timer.wait_time*2
	$Timer.stop()
	$Label.text=str(val)
	$Timer.wait_time = 0.1
	$Timer.start()
	for i in range(6):
		$Border.color = outerColor.inverted()
		await $Timer.timeout
		$Border.color = outerColor
		await $Timer.timeout
	rolling=false
	
