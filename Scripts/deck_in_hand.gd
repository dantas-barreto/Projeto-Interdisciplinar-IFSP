extends Node2D

@onready var attackCardScene: PackedScene = preload("res://Scenes/Cards/AttackCard.tscn")
@onready var defendCardScene: PackedScene = preload("res://Scenes/Cards/DefenseCard.tscn")

@onready var hand: Hand = $CanvasLayer/Hand
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	var attackCard = attackCardScene.instantiate()
	hand.add_card(attackCard)


func _on_button_2_pressed():
	var defendCard = defendCardScene.instantiate()
	hand.add_card(defendCard)
