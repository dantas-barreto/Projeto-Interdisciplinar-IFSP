extends Node2D

func activate(game_state: Dictionary):
	game_state.get("character").spend_health(1)
	game_state.get("targets")[0].take_damage(1)
