extends Node2D

signal card_activated(card: UsableCard)

@export var deck: Deck
@export var debug_mode: bool =  true:
	set(value):
		if !is_node_ready():
			await ready

		debug_mode = value
		$Button.visible = debug_mode
		$Button2.visible = debug_mode
		$Button3.visible = debug_mode

@onready var attackCardScene: PackedScene = preload("res://Scenes/Cards/AttackCard.tscn")
@onready var revivifyCardScene: PackedScene = preload("res://Scenes/Cards/RevivifyCard.tscn")
@onready var defendCardScene: PackedScene = preload("res://Scenes/Cards/DefendCard.tscn")

@onready var fireballCardScene: PackedScene = preload("res://Scenes/Cards/Fireball.tscn")

@onready var table: Table = $Table
@onready var hand: Hand = $Hand

func _ready():
	pass

func _process(delta):
	pass

func add_card(card_with_id: CardWithID):
	$Hand.add_card(card_with_id.card)

func _on_attack_pressed():
	var attackCard = attackCardScene.instantiate()
	deck.add_card(attackCard)

func _on_revivify_pressed():
	var revivifyCard = revivifyCardScene.instantiate()
	deck.add_card(revivifyCard)

func _on_defend_pressed() -> void:
	var defendCard = defendCardScene.instantiate()
	deck.add_card(defendCard)

func _on_hand_card_transfer_to_table(card: UsableCard) -> void:
	if(card.gettype() == "spell"):
		card_activated.emit(card)
	else:
		table.add_card(card)
	hand.remove_card(hand.current_selected_card_index)

func _on_table_card_activated(card: UsableCard) -> void:
	card_activated.emit(card)
