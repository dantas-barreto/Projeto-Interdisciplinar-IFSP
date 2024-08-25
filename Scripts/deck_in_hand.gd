extends Node2D

@onready var attackCardScene: PackedScene = preload("res://Scenes/Cards/AttackCard.tscn")
@onready var defenseCardScene: PackedScene = preload("res://Scenes/Cards/DefenseCard.tscn")
@onready var spawnPoint = $CanvasLayer/Spawn

func _ready():
	pass

func _process(delta):
	pass

func _on_button_pressed():
	var attackCard = attackCardScene.instantiate()
	spawnPoint.add_child(attackCard)

func _on_button_2_pressed():
	var defenseCard = defenseCardScene.instantiate()
	spawnPoint.add_child(defenseCard)
