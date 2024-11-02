extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	caster.spend_health(2)
	for target in game_state.get("targets"):
		target.dont_attack()
