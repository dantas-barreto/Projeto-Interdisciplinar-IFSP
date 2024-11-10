extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	caster.spend_health(3)

func activate_in_play(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	var your_monster: Array = game_state.get("your_monster")
	var targets: Array = game_state.get("targets")
	var enemy: Character = game_state.get("enemy")
	
	if(!targets.is_empty()):
		wind(targets[0])

func wind(creature: UsableCard):
	creature.dont_attack()
