@tool
class_name Card extends Node2D

@export var cardCost: int = 1
@export var cardName: String = "Card Name"
@export var cardDescription: String = "Card Description"
@export var cardImage: Sprite2D

@onready var cardCostLabel: Label = $CardCost/CardCostLabel
@onready var cardNameLabel: Label = $CardName/CardNameLabel
@onready var cardDescriptionLabel: Label = $CardDescription/CardDescriptionLabel

func _ready():
	setCardValues(cardCost, cardName, cardDescription)

func setCardValues(_cost: int, _name: String, _description: String):
	cardCost = _cost
	cardName = _name
	cardDescription = _description
	
	_update_graphics()


func _update_graphics():
	if cardCostLabel.get_text() != str(cardCost):
		cardCostLabel.set_text(str(cardCost))
	if cardNameLabel.get_text() != str(cardName):
		cardNameLabel.set_text(cardName)
	if cardDescriptionLabel.get_text() != str(cardDescription):
		cardDescriptionLabel.set_text(cardDescription)

func activate():
	pass

func _process(_delta):
	_update_graphics()
