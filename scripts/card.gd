class_name Card extends Node2D

signal pressed()

@export var cardId:String = "Blank"

## Assign the card a string (Key from definitions)
func cardAssign(key:String):
	cardId = key
	$Sprite2D.texture = CardDefs.d[key]["image"]

##Returns the id key string
func getCardId() -> String:
	return cardId

func _on_button_pressed() -> void:
	pressed.emit()

func select(selection: bool):
	if selection:
		$ColorRect.color = Color(1.0, 1.0, 0.0, 0.478)
	else:
		$ColorRect.color = Color(0,0,0,0)
