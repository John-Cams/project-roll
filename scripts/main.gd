extends Control

func _ready() -> void:
	$Dice.roll()
	
func _process(delta):
	if Input.is_action_pressed("space"):
		$Dice.roll()
