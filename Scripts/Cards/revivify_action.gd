extends Node2D

func activate(game_state: Dictionary):
	game_state.get("caster").remove_health(1)
	game_state.get("caster").add_health(2)
