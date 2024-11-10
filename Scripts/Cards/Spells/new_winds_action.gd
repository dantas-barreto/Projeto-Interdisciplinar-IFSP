extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	var targets: Array = game_state.get("targets")
	caster.spend_health(4)
	caster.add_health(1)
	if(targets.size() > 0):
		var target: UsableCard = targets[0]
		target.dont_attack()
	caster.add_card_from_deck(2)
