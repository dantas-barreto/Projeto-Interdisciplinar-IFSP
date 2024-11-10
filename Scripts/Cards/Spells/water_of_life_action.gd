extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	caster.spend_health(5)
	#game_state.get("your_cemitery")[0].revive()
