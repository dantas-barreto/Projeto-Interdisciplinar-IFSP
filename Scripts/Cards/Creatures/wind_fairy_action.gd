extends Sprite2D

func activate(game_state: Dictionary):
	var caster: Character = game_state.get("caster")
	caster.spend_health(1)

func wind(creature: Card):
	creature.card_attack = 0
