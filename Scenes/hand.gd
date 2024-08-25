@tool
extends Node2D

@export var handRadius: int = 100

@onready var collisionShape: CollisionShape2D = $DebugShape

func get_card_position(angle: float):
	pass

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	# tool logic
	if (collisionShape.shape as CircleShape2D).radius != handRadius:
		(collisionShape.shape as CircleShape2D).set_radius(handRadius)
