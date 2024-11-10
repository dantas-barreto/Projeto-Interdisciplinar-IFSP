extends Node2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	var your_monster: Array = game_state.get("your_monster")
	caster.spend_health(2)
	if(your_monster.size() > 0):
		var target: UsableCard = your_monster[0]
		target.add_armor(4)
