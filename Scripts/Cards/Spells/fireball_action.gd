extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	caster.spend_health(3)
	game_state.get("enemy").take_damage(6)
