extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	caster.spend_health(3)

func activate_in_play(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	var your_monster: Array = game_state.get("your_monster")
	var targets: Array = game_state.get("targets")
	var enemy: Character = game_state.get("enemy")
	
	burn(targets)
	health_pool(caster)

func burn(creatures: Array) -> void:
	for i in range(creatures.size() - 1):
		var creature: UsableCard = creatures[i]
		creature.take_damage(1)

func health_pool(player: Character) -> void:
	player.add_health(3)
