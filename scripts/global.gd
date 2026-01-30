extends Node

var dice:Array[Dice]

var cards:Array[Card]
var cardsHovered:Array[bool]
var topCard:int = -1

const CARDLAYER = 2
const HELDCARDLAYER = 3

var heldCard:Card
var mouseOffset:Vector2

func _process(delta: float) -> void:
	for i in cardsHovered.size():
		if cardsHovered[i]:
			topCard = i
