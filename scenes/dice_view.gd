extends Node3D

const DICEPATH = preload("res://scenes/Dice.tscn")

@onready var dice = [get_node("Dice")]

##Roll all dice
func roll():
	for die in dice:
		var impulse_force = Vector3(4*randf()-0.5, 4*randf(), 4*randf()-0.5)
		var relative_position = Vector3(4*randf()-0.5, 4*randf()-0.5, 4*randf()-0.5)
		die.apply_impulse(impulse_force, relative_position)
	for die in dice:
		await die.sleeping_state_changed
		while not die.sleeping:
			await die.sleeping_state_changed
		die.setTop()
		

func addDice(team):
	var newDice = DICEPATH.instantiate()
	newDice.teamId = team
	add_child(newDice)
	dice.append(newDice)

func getVal(ind) -> int:
	return dice[ind].getVal()
	
func _process(delta: float) -> void:
	#Input actions
	if Input.is_action_just_pressed("space"):
		await roll()


func _on_oops_body_entered(body: Node3D) -> void:
	body.position = Vector3.ZERO
	body.linear_velocity = Vector3.ZERO
