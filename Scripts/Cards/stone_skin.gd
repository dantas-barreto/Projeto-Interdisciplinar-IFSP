extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	caster.spend_health(2)
	game_state.get("your_monster")[0].add_armor(4)
