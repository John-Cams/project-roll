extends Node

var teamColors:Array[Color] = [
	Color(0.0, 0.0, 1.0, 1.0),
	Color(1.0, 0.0, 0.0, 1.0),
	]

#var diceList:Array[Dice]
var handCards:Array[Card]

var cardTrays:Array[Array]

var cardAreas: Dictionary = {
	"Hand": [] as Array[Card],
	"Dice1": [] as Array[Card],
	"Dice2": [] as Array[Card]
}

@export var selectedCard:Card
