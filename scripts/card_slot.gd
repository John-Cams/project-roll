extends Control

var currentCard:Card = null

func mouseInside() -> bool:
	return (
		get_global_mouse_position().x >= global_position.x and
		get_global_mouse_position().y >= global_position.y and 
		get_global_mouse_position().x <= global_position.x+128 and
		get_global_mouse_position().y <= global_position.y+180
	)

func _input(event: InputEvent) -> void:
		
	if event.is_action_released("mouseHeld") && mouseInside():
		if Global.heldCard != null:
			if currentCard != null:
				var temp:Card = currentCard
				temp.global_position = $Border.global_position + Vector2(200,0)
			currentCard = Global.heldCard
			currentCard.global_position =  $Slot.global_position
				
			
func _process(delta: float) -> void:
	print(currentCard)
