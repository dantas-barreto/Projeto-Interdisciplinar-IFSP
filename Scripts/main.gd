extends Node2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_deck_in_hand_card_activated(card: UsableCard) -> void:
	card.activate({
		"caster": $MainScreen/PlayerCharacter,
		"targets": [$MainScreen/EnemyCharacter]
	})
