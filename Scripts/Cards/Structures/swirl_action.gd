extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	caster.spend_health(2)

func buy_card(player: Character):
	player.increase_draw_limit(1)
