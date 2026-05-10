class_name Card extends Node2D

signal pressed()

@export var cardId:String = "Blank"
@export var cardLocation:String = "Hand"
@export var cardInd:int = 0

## Assign the card a string (Key from definitions)
func cardAssign(key:String):
	cardId = key
	$Sprite2D.texture = CardDefs.d[key]["image"]

##Returns the id key string
func getCardId() -> String:
	return cardId

func locationAssign(loco: String, ind: int):
	cardLocation = loco
	cardInd = ind
	
func getLocation() -> Array:
	return [cardLocation, cardInd]

func _on_button_pressed() -> void:
	pressed.emit()

func select(selection: bool):
	if selection:
		$ColorRect.color = Color(1.0, 1.0, 0.0, 0.478)
	else:
		$ColorRect.color = Color(0,0,0,0)
		
func randCard():
	while(getCardId() == "Blank"):
		cardAssign(CardDefs.d.keys().pick_random())
