extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	caster.spend_health(10)

func activate_in_play(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	var your_monster: Array = game_state.get("your_monster")
	var targets: Array = game_state.get("targets")
	var enemy: Character = game_state.get("enemy")
	
	burn(targets)
	health_pool(caster)

func attack(game_state: Dictionary, card_attack: int):
	var caster: Character = game_state.get("caster")
	var your_monster: Array = game_state.get("your_monster")
	var targets: Array = game_state.get("targets")
	var enemy: Character = game_state.get("enemy")
	
	enemy.take_damage(card_attack)
	enemy.take_damage(card_attack)

func burn(creatures: Array) -> void:
	for creature in creatures:
		creature.take_damage(4)

func health_pool(player: Character) -> void:
	player.add_health(1)
