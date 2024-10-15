extends Node2D

signal card_activated(card: UsableCard)

@onready var attackCardScene: PackedScene = preload("res://Scenes/Cards/AttackCard.tscn")
@onready var revivifyCardScene: PackedScene = preload("res://Scenes/Cards/RevivifyCard.tscn")

@onready var hand: Hand = $Hand

func _ready():
	pass

func _process(delta):
	pass

func _on_button_pressed():
	var attackCard = attackCardScene.instantiate()
	hand.add_card(attackCard)

func _on_button_2_pressed():
	var revivifyCard = revivifyCardScene.instantiate()
	hand.add_card(revivifyCard)

func _on_hand_card_activated(card: UsableCard) -> void:
	card_activated.emit(card)
