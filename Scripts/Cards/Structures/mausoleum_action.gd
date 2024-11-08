extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	caster.spend_health(7)

func defense(player: Character) -> void:
	player.add_armor(4)
