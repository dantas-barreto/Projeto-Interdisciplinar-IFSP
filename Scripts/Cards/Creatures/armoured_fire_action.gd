extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	caster.spend_health(1)

func activate_in_play(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	var your_monster: Array = game_state.get("your_monster")
	var targets: Array = game_state.get("targets")
	var enemy: Character = game_state.get("enemy")
	
	defense(caster)
	burn(targets)

func defense(player: Character) -> void:
	player.add_armor(1)

func burn(creatures: Array) -> void:
	for creature in creatures:
		creature.take_damage(1)
