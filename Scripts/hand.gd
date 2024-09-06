@tool
class_name Hand extends Node2D

@export var hand_radius: int = 1000
@export var card_angle: float = -90
@export var angle_limit: float = 20
@export var max_spread: float = 5

@onready var test_card = $TestCard
@onready var collision_shape: CollisionShape2D = $DebugShape

var hand: Array = []

func add_card(card: Node2D):
	hand.push_back(card)
	

func reposition_cards():
	var min_spread = min(angle_limit / hand.size(), max_spread)
	for card in hand:
		pass

func get_card_position(angle_in_deg: float) -> Vector2:
	var x: float = hand_radius * cos(deg_to_rad(angle_in_deg))
	var y: float = hand_radius * sin(deg_to_rad(angle_in_deg))
	return Vector2(x, y)

func _card_transform_update(card: Node2D, angle: float):
	card.set_position(get_card_position(card_angle))
	card.set_rotation(deg_to_rad(card_angle + 90))

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	# tool logic
	if (collision_shape.shape as CircleShape2D).radius != hand_radius:
		(collision_shape.shape as CircleShape2D).set_radius(hand_radius)
	_card_transform_update(test_card, hand_radius )
