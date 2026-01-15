extends Control

@export var diceVal:PackedInt32Array
@export var diceMax:PackedInt32Array



func roll():
	for i in diceMax.size():
		diceVal[i] = randi_range(1, diceMax[i])
		

func ready():
	diceVal.clear()
	for i in diceMax:
		diceVal.append(1)

func addDice(size:int, ):
