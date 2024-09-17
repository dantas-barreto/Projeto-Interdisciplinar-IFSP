extends Node2D

@onready var attackCardScene: PackedScene = preload("res://Scenes/Cards/AttackCard.tscn")
@onready var defenseCardScene: PackedScene = preload("res://Scenes/Cards/DefenseCard.tscn")

@onready var hand: Hand = $CanvasLayer/Hand

func _ready():
	pass

func _process(_delta):
	pass

func _on_button_pressed():
	var attackCard = attackCardScene.instantiate()
	hand.add_card(attackCard)

func _on_button_2_pressed():
	var defenseCard = defenseCardScene.instantiate()
	hand.add_card(defenseCard)
