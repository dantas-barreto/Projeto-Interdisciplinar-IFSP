extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	caster.spend_health(3)

func burn(creatures: Array) -> void:
	for creature in creatures:
		creature.take_damage(1)

func health_pool(player: Character) -> void:
	player.add_health(3)
