extends Node2D

@export var cardCost: int = 1
@export var cardDescription: String = "Card Description"
@export var cardImage: Node2D

@onready var cardCostLabel: Label = $CardCost/CardCostLabel
@onready var cardDescriptionLabel: Label = $CardDescription/CardDescriptionLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	cardCostLabel.set_text(str(cardCost))
	cardDescriptionLabel.set_text(cardDescription)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
