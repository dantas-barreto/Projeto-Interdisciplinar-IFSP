extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	caster.spend_health(2)

func buffAll(buff_defense: int, creatures: Array):
	for creature in creatures:
		creature.defense = buff_defense
