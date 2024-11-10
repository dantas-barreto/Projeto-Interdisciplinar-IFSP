extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	caster.spend_health(2)

func activate_in_play(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	var your_monster: Array = game_state.get("your_monster")
	var targets: Array = game_state.get("targets")
	var enemy: Character = game_state.get("enemy")
	
	buffAll(1, your_monster)

func buffAll(buff_defense: int, creatures: Array):
	for i in creatures:
		var creature: UsableCard = creatures[i]
		creature.add_armor(buff_defense)
