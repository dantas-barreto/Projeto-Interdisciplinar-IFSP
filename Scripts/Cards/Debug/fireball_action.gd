extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	caster.spend_health(3)
	game_state.get("targets")[0].take_damage(6)
