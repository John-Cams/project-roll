extends Control

@export var currentCard:Card = null

func mouseInside() -> bool:
	return (
		get_global_mouse_position().x >= global_position.x and
		get_global_mouse_position().y >= global_position.y and 
		get_global_mouse_position().x <= global_position.x+$Slot.size.x and
		get_global_mouse_position().y <= global_position.y+$Slot.size.y
	)

func _input(event: InputEvent) -> void:
		
	if event.is_action_released("mouseHeld") && mouseInside():
		if Global.heldCard != null:
			if currentCard != null:
				var temp:Card = currentCard
				temp.global_position = $Border.global_position + Vector2(200,0)
			currentCard = Global.heldCard
			currentCard.global_position =  $Slot.global_position
			
	if event.is_action_pressed("mouseHeld") && mouseInside():
		currentCard = null
		
	if event.is_action("right"):
		position.x += 1
				
			
func _process(delta: float) -> void:
	if !Input.is_action_pressed("mouseHeld") && currentCard != null:
		currentCard.global_position = $Slot.global_position

func getCard() -> Card:
	if currentCard == null:
		return null
	return currentCard
