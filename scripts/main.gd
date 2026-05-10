extends Node2D

var CARDPATH = preload("res://scenes/Card.tscn")
var currentTray = 0

var vals = [0,0]

@onready var diceScene = get_node("SubViewportContainer//SubViewport//Control")

@onready var cardTrayCards:Array[Card] = [
	get_node("CardTray/Card"),get_node("CardTray/Card2"),
	get_node("CardTray/Card3"),get_node("CardTray/Card4"),
	get_node("CardTray/Card5"),get_node("CardTray/Card6"),
]

@onready var enemyOffset = randi_range(1, 6)
@onready var type = ["Normal", "Fire", "Air"].pick_random()

# Gameplay stages
# Stage A: Hand gets filled, either keep play or discard cards
# Stage B: The roll
# Stage C: The points calculated the power advantages made
# Loop

#func _process(delta: float) -> void:
	##Input actions
	#if Input.is_action_just_pressed("space"):
		#await diceScene.roll()
		#
func _ready() -> void:
	diceScene.addDice(0)
	diceScene.addDice(1)
	roundStart()

func roundStart():
	
	$Test/EnemyOffset.text = "+ %d %s" % [enemyOffset, type]
	
	handFill()
	for i in 6:
		Global.cardAreas["Dice1"].append(cardTrayCards[i])
		cardTrayCards[i].locationAssign("Dice1",i)
		cardTrayCards[i].pressed.connect(cardSelect.bind("Dice1", i))

#func cardSelect():
	#Global.selectedCard = Global.

func handFill():
	for i in 6:
		var card:Card = CARDPATH.instantiate()
		add_child(card)
		card.randCard()
		Global.cardAreas["Hand"].append(card)
		card.position = Vector2(310+( (i)*(135) ),712.5)
		card.locationAssign("Hand",i)
		card.pressed.connect(cardSelect.bind("Hand", i))
		
func cardSelect(area, ind):
	if Global.selectedCard == null:
		for aArea in Global.cardAreas:
			for card in Global.cardAreas[area]:
				card.select(false)
		Global.cardAreas[area][ind].select(true)
		Global.selectedCard = Global.cardAreas[area][ind]
	else:
		var tempLoco = Global.selectedCard.getLocation()
		var oldCard = Global.cardAreas[area][ind].getCardId()
		Global.cardAreas[area][ind].cardAssign( Global.selectedCard.getCardId() )
		Global.cardAreas[tempLoco[0]][tempLoco[1]].cardAssign( oldCard )
		Global.cardAreas[tempLoco[0]][tempLoco[1]].select( false )
		Global.selectedCard = null

func _on_button_pressed() -> void:
	await diceScene.roll()
	calc()
	
func calc():
	vals[1] += enemyOffset
	for die:Dice in diceScene.getDice():
		if(die.getTeamId() == 0):
			var weBetter = ( 
				(Global.cardAreas["Dice1"][die.getVal()].getCardId()=="Fire 1" && type == "Air") || 
				(Global.cardAreas["Dice1"][die.getVal()].getCardId()=="Water 1" && type == "Fire"))
				
			vals[0] +=  CardDefs.d[ Global.cardAreas["Dice1"][die.getVal()].getCardId() ]["func"].call( die.getVal()+1, weBetter)
		else:
			vals[1] += die.getVal()+1
	print(vals)
	$Test/PlayerVal.text = str(vals[0])
	$Test/EnemyVal.text = str(vals[1])
	end()
	
func end():
	$Stage.visible = true
	if vals[0] > vals[1]:
		$Stage.text = "You win!"
	elif vals[0] == vals[1]:
		$Stage.text = "Tie?!?!"
	else:
		$Stage.text = "You lost :("

func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Start.tscn")
