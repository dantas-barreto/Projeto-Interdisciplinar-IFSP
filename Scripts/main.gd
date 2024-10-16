extends Node2D

@export var player_character: Character

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_deck_in_hand_card_activated(card: UsableCard) -> void:
	card.activate({
		"caster": $MainScreen/PlayerCharacter,
		"targets": [$MainScreen/EnemyCharacter]
	})

func _on_inflict_1_damage_pressed() -> void:
	player_character.take_damage(1)

func _on_inflict_3_damage_pressed() -> void:
	player_character.take_damage(3)
