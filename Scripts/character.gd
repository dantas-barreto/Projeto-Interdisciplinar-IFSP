@tool
class_name Character extends Node2D

@export var health: int = 20

@onready var health_label: Label = $Sprite2D/HealthLabel

func set_health_value(_health: int):
	health = _health
	update_health_value()

func update_health_value():
	if health_label.get_text() != str(health):
		health_label.set_text(str(health))

func remove_health(amount: int):
	health -= amount

func add_health(amount: int):
	health += amount

func _ready() -> void:
	set_health_value(health)

func _process(delta: float) -> void:
	update_health_value()
