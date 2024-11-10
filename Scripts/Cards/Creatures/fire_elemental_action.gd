extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	caster.spend_health(10)

func burn(creatures: Array) -> void:
	for creature in creatures:
		creature.take_damage(4)

func health_pool(player: Character) -> void:
	player.add_health(1)
