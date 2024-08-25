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
	
	cardCostLabel.set_text(str(_cost))
	cardNameLabel.set_text(_name)
	cardDescriptionLabel.set_text(_description)

func activate():
	pass

func _process(delta):
	pass
