extends Node2D

signal card_activated(card: UsableCard)

@onready var attackCardScene: PackedScene = preload("res://Scenes/Cards/AttackCard.tscn")
@onready var revivifyCardScene: PackedScene = preload("res://Scenes/Cards/RevivifyCard.tscn")
@onready var defendCardScene: PackedScene = preload("res://Scenes/Cards/DefendCard.tscn")

@onready var table: Table = $Table
@onready var hand: Hand = $Hand

func _ready():
	pass

func _process(delta):
	pass

func _on_attack_pressed():
	var attackCard = attackCardScene.instantiate()
	hand.add_card(attackCard)

func _on_revivify_pressed():
	var revivifyCard = revivifyCardScene.instantiate()
	hand.add_card(revivifyCard)

func _on_defend_pressed() -> void:
	var defendCard = defendCardScene.instantiate()
	hand.add_card(defendCard)

func _on_hand_card_activated(card: UsableCard) -> void:
	hand.remove_card(hand.current_selected_card_index)
	table.add_card(card)
