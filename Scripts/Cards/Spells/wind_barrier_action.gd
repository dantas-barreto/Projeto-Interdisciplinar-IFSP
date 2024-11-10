extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	var targets: Array = game_state.get("targets")
	caster.spend_health(2)
	for i in targets:
		var target: UsableCard = targets[i]
		target.dont_attack()
