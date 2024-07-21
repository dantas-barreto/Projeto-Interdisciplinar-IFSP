extends Node2D

@onready var cardScene: PackedScene = preload("res://Scenes/card.tscn")
@onready var spawnPoint = $CanvasLayer/Spawn

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	var card: Card = cardScene.instantiate()
	spawnPoint.add_child(card)
	card.setCardValues(2, "cool name", "cool description")
	card.visible = true


func _on_button_2_pressed():
	var card: Card = cardScene.instantiate()
	spawnPoint.add_child(card)
	card.setCardValues(3, "other name", "other description")
	card.visible = true
