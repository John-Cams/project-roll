extends Node3D

const DICEPATH = preload("res://scenes/Dice.tscn")

signal doneRolling()

@onready var dice = []

func _process(delta: float) -> void:
	$Label3D.text = "%s %s" % [dice[0].sleeping, dice[1].sleeping] 

##Roll all dice
func roll():
	for die in dice:
		die.sleeping = false
		var impulse_force = Vector3(4*randf()-0.5, 4*randf(), 4*randf()-0.5)
		var relative_position = Vector3(4*randf()-0.5, 4*randf()-0.5, 4*randf()-0.5)
		die.apply_impulse(impulse_force, relative_position)
		
	var allSleeping = false
	while !allSleeping:
		await get_tree().physics_frame
		allSleeping = true
		for die in dice:
			if !die.sleeping:
				allSleeping = false
				break
	for die in dice:
			die.setTop()
		
	emit_signal("doneRolling")
		
func getDice() -> Array:
	return dice

func addDice(team):
	var newDice = DICEPATH.instantiate()
	newDice.setTeamId(team)
	add_child(newDice)
	dice.append(newDice)

func getVal(ind) -> float:
	return dice[ind].getVal()

func _on_oops_body_entered(body: Node3D) -> void:
	body.position = Vector3.ZERO
	body.linear_velocity = Vector3.ZERO
