extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	caster.spend_health(4)
	caster.add_health(1)
	game_state.get("targets")[0].dont_attack()
	caster.add_card_from_deck(2)
