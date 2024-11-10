extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	caster.spend_health(2)

func activate_in_play(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	var your_monster: Array = game_state.get("your_monster")
	var targets: Array = game_state.get("targets")
	var enemy: Character = game_state.get("enemy")
	
	buy_card(caster)

func buy_card(player: Character):
	player.add_card_from_deck(1)
