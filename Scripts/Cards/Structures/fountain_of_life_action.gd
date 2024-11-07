extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	caster.spend_health(5)

func health_pool(player: Character) -> void:
	player.add_health(3)