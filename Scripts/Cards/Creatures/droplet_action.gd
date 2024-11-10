extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	caster.spend_health(1)

func defense(player: Character) -> void:
	player.add_armor(1)

func health_pool(player: Character) -> void:
	player.add_health(1)
