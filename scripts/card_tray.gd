extends Control

@export var dice:Dice

func afterRoll():
	print("Running")
	var cards = [
	$CardSlot.getCard(),
	$CardSlot.getCard(),
	$CardSlot.getCard(),
	$CardSlot.getCard(),
	$CardSlot.getCard(),
	$CardSlot.getCard()]
	
	var value = dice.val
	if cards[value-1] == null:
		print("Nothing")
		return
		
	var effect = $CardSlot.currentCard.getCardID()
	print(effect)
	
	
