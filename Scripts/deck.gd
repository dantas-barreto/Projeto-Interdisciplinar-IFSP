extends Node2D

@onready var attackCardScene: PackedScene = preload("res://Scenes/Cards/AttackCard.tscn")
@onready var defenseCardScene: PackedScene = preload("res://Scenes/Cards/DefenseCard.tscn")
@onready var spawnPoint = $CanvasLayer/Spawn

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	var attackCard = attackCardScene.instantiate()
	spawnPoint.add_child(attackCard)
	attackCard.visible = true


func _on_button_2_pressed():
	var defenseCard: Card = defenseCardScene.instantiate()
	spawnPoint.add_child(defenseCard)
	defenseCard.visible = true
