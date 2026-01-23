extends Control

@export var color:Color
@export var maxVal:int
@export var val:int

var rollTimes = 0
var rollFlickers = 0
var rolling = false

func roll():
	if not rolling:
		rolling = true
		val = randi_range(1,maxVal)
		$Rolling.start()

func _on_timer_timeout() -> void:
	if rollTimes == 8:
		$Rolling.stop()
		$Rolling.wait_time = 0.1
		$Rolling.start()
		for i in range(4):
			$DiceOutline/Dice/DiceLabel.text = str(val)
			await $Rolling.timeout
			$DiceOutline/Dice.color = Color(1.0, 1.0, 0.0, 1.0)
			await $Rolling.timeout
			$DiceOutline/Dice.color = Color(1.0, 1.0, 1.0, 1.0)
		$Rolling.stop()
		
		$Rolling.wait_time = 0.01
		rollTimes = 0
		rollFlickers = 0
		rolling = false
		return
	
	$Rolling.wait_time *= 2
	rollTimes += 1
	$DiceOutline/Dice/DiceLabel.text = str(randi_range(1,maxVal))
		
		
