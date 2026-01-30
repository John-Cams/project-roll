extends Control

func _ready() -> void:
	$Dice.doneRolling.connect(_on_dice_roll_finished)
	
func _process(delta):
	if Input.is_action_just_pressed("space"):
		print("Wa")
		$Dice.roll()
		
func _on_dice_roll_finished():
	$CardTray.afterRoll()
