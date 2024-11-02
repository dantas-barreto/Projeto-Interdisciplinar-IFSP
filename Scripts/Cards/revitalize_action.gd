extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	caster.spend_health(2)
	caster.add_health(1)
	caster.add_card_from_deck(2)
