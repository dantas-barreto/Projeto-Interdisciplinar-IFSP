extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	caster.spend_health(2)

func health_pool(player: Character):
	player.add_health(1)
