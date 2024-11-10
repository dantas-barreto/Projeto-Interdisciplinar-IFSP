extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	caster.spend_health(10)

func activate_in_play(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	var your_monster: Array = game_state.get("your_monster")
	var targets: Array = game_state.get("targets")
	var enemy: Character = game_state.get("enemy")
	
	defense(caster)
	health_pool(caster)

func defense(player: Character) -> void:
	player.add_armor(1)

func attack(game_state: Dictionary, card_attack: int):
	var caster: Character = game_state.get("caster")
	var your_monster: Array = game_state.get("your_monster")
	var targets: Array = game_state.get("targets")
	var enemy: Character = game_state.get("enemy")
	
	enemy.take_damage(card_attack)
	enemy.take_damage(card_attack)

func health_pool(player: Character) -> void:
	player.add_health(3)
