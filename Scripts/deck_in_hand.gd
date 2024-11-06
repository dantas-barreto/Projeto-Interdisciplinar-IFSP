extends Node2D

signal card_activated(card: UsableCard)

@onready var attackCardScene: PackedScene = preload("res://Scenes/Cards/Debug/AttackCard.tscn")
@onready var revivifyCardScene: PackedScene = preload("res://Scenes/Cards/Debug/RevivifyCard.tscn")
@onready var defendCardScene: PackedScene = preload("res://Scenes/Cards/Debug/DefendCard.tscn")

@onready var fireballCardScene: PackedScene = preload("res://Scenes/Cards/Spells/Fireball.tscn")

@onready var flameTowerCardScene: PackedScene = preload("res://Scenes/Cards/Structures/FlameTower.tscn")

@onready var table: Table = $Table
@onready var hand: Hand = $Hand

func _ready():
	pass

func _process(delta):
	pass

func reset():
	$Hand.empty_hand()

func _on_attack_pressed():
	var attackCard = attackCardScene.instantiate()
	hand.add_card(attackCard)

func _on_revivify_pressed():
	var revivifyCard = revivifyCardScene.instantiate()
	hand.add_card(revivifyCard)

func _on_defend_pressed() -> void:
	var defendCard = defendCardScene.instantiate()
	hand.add_card(defendCard)

func _on_hand_card_transfer_to_table(card: UsableCard) -> void:
	if(card.get_type() == "spell"):
		card_activated.emit(card)
	else:
		table.add_card(card)
	hand.remove_card(hand.current_selected_card_index)

func _on_table_card_activated(card: UsableCard) -> void:
	card_activated.emit(card)
