class_name UsableCard extends Node2D

signal mouse_entered(card: Card)
signal mouse_exited(card: Card)

@export var action: Node2D

func _ready():
	pass

func _process(_delta):
	pass

func highlight():
	$Card.highlight()

func unhighlight():
	$Card.unhighlight()

func _on_card_mouse_entered(card: Card):
	mouse_entered.emit(self)
 
func _on_card_mouse_exited(card: Card):
	mouse_exited.emit(self)

func activate(game_state: Dictionary):
	action.activate(game_state)
