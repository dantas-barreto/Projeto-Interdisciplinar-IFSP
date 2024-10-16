@tool
class_name Character extends Node2D

@export var health: int = 20
@export var armor: int = 0

@onready var health_label: Label = $Sprite2D/HealthLabel
@onready var armor_label: Label = $ArmorLabel

func set_health_value(_health: int):
	health = _health
	update_health_value()

func update_health_value():
	if health_label.get_text() != str(health):
		health_label.set_text(str(health))

func update_armor_value():
	if armor > 0:
		armor_label.visible = true
		armor_label.set_text(str(armor)) 
	else:
		armor_label.visible = false

func add_armor(amount: int):
	armor += amount
	
func spend_health(amount: int):
	health -= amount

func take_damage(amount: int):
	var damage = 0
	damage = max(amount - armor, 0)
	if armor > 0:
		armor = armor - amount
	health -= damage

func add_health(amount: int):
	health += amount

func _ready() -> void:
	set_health_value(health)

func _process(delta: float) -> void:
	update_health_value()
	update_armor_value()
