@tool
class_name Hand extends Node2D

@export var hand_radius: int = 1000
@export var card_angle: float = -90
@export var angle_limit: float = 20
@export var max_spread: float = 2.5

@onready var test_card = $TestCard
@onready var collision_shape: CollisionShape2D = $DebugShape

var hand: Array = []

func add_card(card: Node2D):
	hand.push_back(card)
	add_child(card)
	reposition_cards()

func remove_card(index: int) -> Node2D:
	var removing_card = hand[index]
	hand.remove_at(index)
	remove_child(removing_card)
	reposition_cards()
	return removing_card

func reposition_cards():
	var card_spread = min(angle_limit / hand.size(), max_spread)
	var current_angle = -(card_spread * (hand.size() - 1)) / 2 - 90
	for card in hand:
		_update_card_transform(card, current_angle)
		current_angle += card_spread

func get_card_position(angle_in_deg: float) -> Vector2:
	var x: float = hand_radius * cos(deg_to_rad(angle_in_deg))
	var y: float = hand_radius * sin(deg_to_rad(angle_in_deg))
	return Vector2(x, y)

func _update_card_transform(card: Node2D, angle_in_drag: float):
	card.set_position(get_card_position(angle_in_drag))
	card.set_rotation(deg_to_rad(angle_in_drag + 90))

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	# tool logic
	if (collision_shape.shape as CircleShape2D).radius != hand_radius:
		(collision_shape.shape as CircleShape2D).set_radius(hand_radius)
	_update_card_transform(test_card, hand_radius )
