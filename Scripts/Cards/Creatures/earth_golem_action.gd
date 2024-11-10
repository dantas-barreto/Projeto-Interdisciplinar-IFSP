extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	caster.spend_health(3)

func defense(player: Character) -> void:
	player.add_armor(2)

# fazer um if no main pra chamar o ataque da carta duas vezes
