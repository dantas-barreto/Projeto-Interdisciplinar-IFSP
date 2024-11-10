extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	caster.spend_health(4)

func activate_in_play(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	var your_monster: Array = game_state.get("your_monster")
	var targets: Array = game_state.get("targets")
	var enemy: Character = game_state.get("enemy")
	
	burn(targets)

func burn(creatures: Array) -> void:
	for i in creatures:
		var creature: UsableCard = creatures[i]
		creature.take_damage(1)
