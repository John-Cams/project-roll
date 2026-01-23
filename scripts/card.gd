class_name Card extends Control

@export var cardId:int

var dragged = false
var mouseHeld = false

func _ready():
	Global.cards.append(self)
	Global.cardsHovered.append(false)
	
func _process(delta: float) -> void:
	if(mouseInside()):
		Global.cardsHovered[Global.cards.find(self)] = true
	else:
		Global.cardsHovered[Global.cards.find(self)] = false
	
	if dragged:
		global_position = get_global_mouse_position() - Global.mouseOffset
	
	if cardId == 1:
		$ColorRect.color = Color(0.953, 0.0, 0.0, 1.0)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("mouseHeld"):
		mouseHeld = true
		print("HIII")
		print(get_global_mouse_position())
		if mouseInside() and Global.topCard == Global.cards.find(self):
			Global.mouseOffset = get_global_mouse_position() - global_position
			dragged = true
			Global.heldCard = self
			for card in Global.cards:
				card.z_index = Global.CARDLAYER
			self.z_index = Global.HELDCARDLAYER
		
	
	if event.is_action_released("mouseHeld"):
		mouseHeld = false
		print("BAII")
		print(get_global_mouse_position())
		dragged = false

func mouseInside() -> bool:
	return (
		get_global_mouse_position().x >= global_position.x and
		get_global_mouse_position().y >= global_position.y and 
		get_global_mouse_position().x <= global_position.x+128 and
		get_global_mouse_position().y <= global_position.y+180
	)
