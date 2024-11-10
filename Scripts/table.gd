@tool
class_name Table extends Node2D

signal table_card_activated(card: UsableCard)

@export var table_size_x: int = 1500
@export var table_size_y: int = 250
@export var spread_limit: int = 1300
@export var max_card_spread: int = 300

@onready var test_card = $TestCard
@onready var collision_shape: CollisionShape2D = $DebugShape

var table: Array = []
var structures: Array = []
var touched: Array = []
var current_selected_card_index: int = -1

func add_card(card: Node2D):
	table.push_back(card)
	add_child(card)
	card.mouse_entered.connect(_handle_card_touched)
	card.mouse_exited.connect(_handle_card_untouched)
	reposition_cards()

func add_structure(card: Node2D):
	structures.push_back(card)
	add_child(card)

func remove_card(index: int):
	var removing_card = table[index]
	table.remove_at(index)
	touched.remove_at(touched.find(removing_card))
	remove_child(removing_card)
	reposition_cards()
	return removing_card

func reposition_cards():
	var card_spread =  min(300, float(spread_limit) / float(table.size()))
	var current_spread = 0
	if table.size() == 1:
		current_spread = 0;
	else:
		current_spread = - (card_spread / 2 * (table.size()-1))
	for card in table :
		_update_card_transform(card, current_spread)
		current_spread += card_spread

func get_card_position(spread: int) -> Vector2:
	var x: int = spread
	var y: int = 0
	return Vector2(x, y)

func _update_card_transform(card: Node2D, card_position: int):
	card.set_position(get_card_position(card_position))

func _handle_card_touched(card):
	touched.push_back(card)

func _handle_card_untouched(card):
	if(current_selected_card_index != -1):
		touched.remove_at(touched.find(card))

func _ready() -> void:
	pass

func _input(event):
	if event.is_action_pressed("mouse_click_left") && current_selected_card_index >= 0:
		var card = table[current_selected_card_index]
		table_card_activated.emit(card)

func _process(delta):
	for card in table:
		current_selected_card_index = -1
		card.unhighlight()

	if !touched.is_empty():
		var highest_touched_index: int = -1
		
		for touched_card in touched:
			highest_touched_index = max(highest_touched_index, table.find(touched_card))
		
		if highest_touched_index >= 0 && highest_touched_index < table.size():
			table[highest_touched_index].highlight()
			current_selected_card_index = highest_touched_index
