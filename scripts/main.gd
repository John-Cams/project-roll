extends Node2D

var CARDPATH = preload("res://scenes/Card.tscn")
var currentTray = 0

@onready var diceScene = get_node("SubViewportContainer//SubViewport//Control")

@onready var cardTrayCards:Array[Card] = [
	get_node("CardTray/Card"),get_node("CardTray/Card2"),
	get_node("CardTray/Card3"),get_node("CardTray/Card4"),
	get_node("CardTray/Card5"),get_node("CardTray/Card6"),
]

# Gameplay stages
# Stage A: Hand gets filled, either keep play or discard cards
# Stage B: The roll
# Stage C: The points calculated the power advantages made
# Loop

func _process(delta: float) -> void:
	#Input actions
	if Input.is_action_just_pressed("space"):
		await diceScene.roll()
		
func _ready() -> void:
	Global.cardTrays.append(["Blank","Blank","Blank","Blank","Blank","Blank"])
	for card in cardTrayCards:
		card.cardAssign("Blank")
		card.pressed.connect( Callable(traySelect).bind(cardTrayCards.find(card)) )
	diceScene.addDice(0)
	diceScene.addDice(0)
	diceScene.addDice(1)
	diceScene.addDice(1)


func _on_button_pressed() -> void:
	var card:Card = CARDPATH.instantiate()
	add_child(card)
	while(card.getCardId() == "Blank"):
		card.cardAssign( CardDefs.d.keys().pick_random() )
	card.pressed.connect( Callable(handSelect).bind(Global.handCards.size()) )
	Global.handCards.append(card)
	card.position = Vector2(310+( (Global.handCards.size() - 1)*(135) ),712.5)


		
func handSelect(ind: int):
	for card in Global.handCards:
		card.select(false)
	Global.handCards[ind].select(true)
	Global.selectedCard = Global.handCards[ind]
	
func traySelect(ind: int):
	if Global.selectedCard == null:
		return
	cardTrayCards[ind].cardAssign(Global.selectedCard.getCardId())
	Global.selectedCard = null
	for card in Global.handCards:
		card.select(false)
