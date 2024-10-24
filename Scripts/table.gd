@tool
class_name Table extends Node2D

signal card_activated(card: UsableCard)

@export var table_size_x: int = 1500
@export var table_size_y: int = 250
@export var spread_limit: int = 1300
@export var max_card_spread: int = 50


@onready var test_card: Card = $PlayerSide/TestCard
@onready var collision_shape: CollisionShape2D = $DebugShape

var table: Array = []
var touched: Array = []
var current_selected_card_index: int = -1

func add_card(card: Node2D):
	table.push_back(card)
	add_child(card)
	card.mouse_entered.connect(_handle_card_touched)
	card.mouse_exited.connect(_handle_card_untouched)
	reposition_cards()

func remove_card(index: int):
	var removing_card = table[index]
	table.remove_at(index)
	touched.remove_at(touched.find(removing_card))
	remove_child(removing_card)
	reposition_cards()
	return removing_card

func reposition_cards():
	var card_spread = min(spread_limit / table.size(), max_card_spread)
	var current_spread = (table_size_x / 2) - (card_spread * (table.size() - 1)) / 2
	for card in table :
		_update_card_transform(card, current_spread)
		current_spread += card_spread

func get_card_position(spread: int) -> Vector2:
	# tenho que resolver essa bosta
	var x: int = spread 
	var y: int = table_size_y / 2
	return Vector2(x, y)

func _update_card_transform(card: Node2D, card_position: float):
	card.set_position(get_card_position(card_position))

func _handle_card_touched(card):
	touched.push_back(card)

func _handle_card_untouched(card):
	touched.remove_at(touched.find(card))

func _ready() -> void:
	pass

func _input(event):
	if event.is_action_pressed("mouse_click_left") && current_selected_card_index >= 0:
		var card = remove_card(current_selected_card_index)
		card_activated.emit(card)
		current_selected_card_index = -1

func _process(delta: float) -> void:
	pass
