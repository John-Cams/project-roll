class_name Dice extends Control

signal doneRolling

@export var color:Color
@export var maxVal:int
@export var val:int
@export var id:int

var rollTimes = 0
var rollFlickers = 0
var rolling = false

func _ready() -> void:
	Global.dice.append(self)

func roll():
	print($Rolling.is_stopped())
	if($Rolling.is_stopped()):
		$Rolling.start()
		print("Rolling")
		val = randi_range(1, maxVal)
		print("Set Value")
		$DiceOutline/Dice.color = Color(1.0, 0.0, 0.0, 1.0)
		print("Set Color")
		$Rolling.wait_time = 0.01
		for i in range(8):
			print(i)
			$DiceOutline/Dice/DiceLabel.text = str(randi_range(1, maxVal))
			await $Rolling.timeout
			$Rolling.wait_time = $Rolling.wait_time*2
		$Rolling.wait_time = 0.1
		$Rolling.stop()
		$Rolling.start()
		for i in range(4):
			$DiceOutline/Dice.color = Color(1.0, 1.0, 0.0, 1.0)
			await $Rolling.timeout
			$DiceOutline/Dice.color = Color(1.0, 1.0, 1.0, 1.0)
			await $Rolling.timeout
		$Rolling.stop()
		emit_signal("doneRolling")
