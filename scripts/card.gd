class_name Card extends Control

@export var cardId:String

var dragged = false
var mouseHeld = false

func _ready():
	Global.cards.append(self)
	Global.cardsHovered.append(false)
	
	if !AllCards.CARD_DEFS.keys().has(cardId):
		$ColorRect.color = Color(1.0, 0.0, 0.0, 1.0)
		$Label.text = "Error"
		return
		
	print("HIII")
	var cardData = AllCards.CARD_DEFS.get(cardId)
	$Label.text = cardId
	$ColorRect.color = cardData[2]
	
	
func _process(delta: float) -> void:
	if(mouseInside()):
		Global.cardsHovered[Global.cards.find(self)] = true
	else:
		Global.cardsHovered[Global.cards.find(self)] = false
	
	if dragged:
		global_position = get_global_mouse_position() - Global.mouseOffset

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("mouseHeld"):
		mouseHeld = true
		if mouseInside() and Global.topCard == Global.cards.find(self):
			Global.mouseOffset = get_global_mouse_position() - global_position
			dragged = true
			Global.heldCard = self
			for card in Global.cards:
				card.z_index = Global.CARDLAYER
			self.z_index = Global.HELDCARDLAYER
		
	
	if event.is_action_released("mouseHeld"):
		mouseHeld = false
		dragged = false
		Global.heldCard = null

func mouseInside() -> bool:
	return (
		get_global_mouse_position().x >= global_position.x and
		get_global_mouse_position().y >= global_position.y and 
		get_global_mouse_position().x <= global_position.x+128 and
		get_global_mouse_position().y <= global_position.y+180
	)
	
func getCardID() -> String:
	if cardId == null:
		return "Nothin"
	return cardId
