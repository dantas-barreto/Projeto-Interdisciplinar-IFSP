extends Node2D

@export var player_character: Character

@onready var game_control:GameController = $GameController
@onready var player_deck_in_hand: Node2D = $PlayerDeckInHand
@onready var enemy_deck_in_hand: Node2D = $EnemyDeckInHand
@onready var deck_ui: PlayableDeckUI = $PlayableDeckUi

@onready var player_deck: Deck = Deck.new()
@onready var enemy_deck: Deck = Deck.new()

var rng = RandomNumberGenerator.new()

var enemy_state: int = rng.randi_range(0, 9)

func restart_game():
	game_control.current_state = GameController.GameState.PLAYER_TURN
	$MainScreen/PlayerCharacter.reset()
	$MainScreen/EnemyCharacter.reset()
	player_deck_in_hand.reset()
	enemy_deck_in_hand.reset()
	deck_ui.deck = player_deck.get_playable_deck()
	$CanvasLayer/StartScreen.visible = true

func _ready() -> void:
	player_deck_in_hand.deck = player_deck
	enemy_deck_in_hand.deck = enemy_deck
	deck_ui.deck = player_deck.get_playable_deck()

func _process(delta: float) -> void:
	
	if $MainScreen/PlayerCharacter.health <= 0:
		game_control.transition(GameController.GameState.GAME0VER)
	elif $MainScreen/EnemyCharacter.health <= 0:
		game_control.transition(GameController.GameState.VICTORY)
	
	if game_control.current_state == GameController.GameState.ENEMY_TURN:
		if enemy_state == 0:
			$MainScreen/EnemyCharacter.spend_health(3)
			$MainScreen/PlayerCharacter.take_damage(3)
		if enemy_state == 1:
			$MainScreen/EnemyCharacter.spend_health(3)
			$MainScreen/EnemyCharacter.add_armor(3)
		if enemy_state == 2:
			$MainScreen/EnemyCharacter.spend_health(3)
			$MainScreen/EnemyCharacter.add_health(6)
		if enemy_state == 3:
			$MainScreen/EnemyCharacter.spend_health(3)
			$MainScreen/PlayerCharacter.take_damage(1)
			$MainScreen/EnemyCharacter.add_armor(1)
			$MainScreen/EnemyCharacter.add_health(2)
		if enemy_state == 4:
			$MainScreen/EnemyCharacter.spend_health(3)
			$MainScreen/PlayerCharacter.take_damage(2)
			$MainScreen/EnemyCharacter.add_armor(1)
		if enemy_state == 5:
			$MainScreen/EnemyCharacter.spend_health(3)
			$MainScreen/PlayerCharacter.take_damage(2)
			$MainScreen/EnemyCharacter.add_health(2)
		if enemy_state == 6:
			$MainScreen/EnemyCharacter.spend_health(3)
			$MainScreen/PlayerCharacter.take_damage(1)
			$MainScreen/EnemyCharacter.add_armor(2)
		if enemy_state == 7:
			$MainScreen/EnemyCharacter.spend_health(3)
			$MainScreen/EnemyCharacter.add_armor(2)
			$MainScreen/EnemyCharacter.add_health(2)
		if enemy_state == 8:
			$MainScreen/EnemyCharacter.spend_health(3)
			$MainScreen/PlayerCharacter.take_damage(1)
			$MainScreen/EnemyCharacter.add_health(4)
		if enemy_state == 9:
			$MainScreen/EnemyCharacter.spend_health(3)
			$MainScreen/EnemyCharacter.add_armor(1)
			$MainScreen/EnemyCharacter.add_health(4)
		
		enemy_state = rng.randi_range(0, 9)
		game_control.transition(GameController.GameState.PLAYER_TURN)
		if(!deck_ui.is_empty()):
			var card_with_id = deck_ui.draw()
			player_deck_in_hand.add_card(card_with_id)
		for structure in player_deck_in_hand.table.structures:
			structure.activate_in_play({
			"caster": $MainScreen/PlayerCharacter,
			"your_monster": player_deck_in_hand.table.table,
			"targets": enemy_deck_in_hand.table.table,
			"enemy": $MainScreen/EnemyCharacter
			})
		$MainScreen/PlayerCharacter.start_turn()
	
	if game_control.current_state == GameController.GameState.VICTORY:
		$CanvasLayer/VictoryOverlay.visible = true
	else:
		$CanvasLayer/VictoryOverlay.visible = false
	
	if game_control.current_state == GameController.GameState.GAME0VER:
		$CanvasLayer/GameOverOverlay.visible = true
	else:
		$CanvasLayer/GameOverOverlay.visible = false

func _input(event: InputEvent) -> void:
	if event.is_action("restart"):
		restart_game()

func _on_table_card_activated(card: UsableCard) -> void:
	var card_cost: int = card.get_cost()
	if game_control.current_state == GameController.GameState.PLAYER_TURN:
		card.activate({
		"caster": $MainScreen/PlayerCharacter,
		"your_monster": player_deck_in_hand.table.table,
		"targets": enemy_deck_in_hand.table.table,
		"enemy": $MainScreen/EnemyCharacter
	})
	elif game_control.current_state == GameController.GameState.ENEMY_TURN:
		card.activate({
		"caster": $MainScreen/EnemyCharacter,
		"your_monster":enemy_deck_in_hand.table.table,
		"targets": player_deck_in_hand.table.table,
		"enemy": $MainScreen/EnemyCharacter
	})

func _on_deck_in_hand_card_activated(card: UsableCard) -> void:
	var card_cost: int = card.get_cost()
	if game_control.current_state == GameController.GameState.PLAYER_TURN:
		if card_cost <= $MainScreen/PlayerCharacter.health:
			card.activate({
			"caster": $MainScreen/PlayerCharacter,
			"your_monster":player_deck_in_hand.table.table,
			"targets": enemy_deck_in_hand.table.table,
			"enemy": $MainScreen/EnemyCharacter
			})
	elif game_control.current_state == GameController.GameState.ENEMY_TURN:
		if card_cost <= $MainScreen/EnemyCharacter.health:
			card.activate({
			"caster": $MainScreen/EnemyCharacter,
			"your_monster":enemy_deck_in_hand.table.table,
			"targets": player_deck_in_hand.table.table,
			"enemy": $MainScreen/PlayerCharacter
			})

#func _on_enemy_table_card_activated(card: UsableCard) -> void:
#	var card_cost: int = card.get_cost()
#	if game_control.current_state == GameController.GameState.ENEMY_TURN:
#		card.activate({
#		"caster": $MainScreen/EnemyCharacter,
#		"targets": $MainScreen/PlayerCharacter
#	})

#func _on_enemy_deck_in_hand_card_activated(card: UsableCard) -> void:
#	var card_cost: int = card.get_cost()
#	if game_control.current_state == GameController.GameState.ENEMY_TURN:
#		card.activate({
#			"caster": $MainScreen/EnemyCharacter,
#			"targets": $MainScreen/PlayerCharacter
#		})
#		card.queue_free()

func _on_inflict_1_damage_pressed() -> void:
	player_character.take_damage(1)

func _on_inflict_3_damage_pressed() -> void:
	player_character.take_damage(3)

func _on_end_turn_pressed() -> void:
	if game_control.current_state == GameController.GameState.PLAYER_TURN:
		game_control.transition(GameController.GameState.ENEMY_TURN)
		$MainScreen/EnemyCharacter.start_turn()

func _on_playable_deck_ui_pressed() -> void:
	if(!deck_ui.is_empty()):
		var card_with_id = deck_ui.draw()
		player_deck_in_hand.add_card(card_with_id)
	pass

func _on_começar_pressed() -> void:
	$"CanvasLayer/tela de começo".visible = false
	player_deck_in_hand.start()
	for i in range(5):
		var card_with_id = deck_ui.draw()
		player_deck_in_hand.add_card(card_with_id)
	enemy_deck_in_hand.start()
	for i in range(5):
		var card_with_id = deck_ui.draw()
		enemy_deck_in_hand.add_card(card_with_id)

func _on_deck_in_hand_starting() -> void:
	deck_ui.deck = player_deck.get_playable_deck()
	for i in range(5):
		var card_with_id = deck_ui.draw()
		player_deck_in_hand.add_card(card_with_id)
	deck_ui.deck = enemy_deck.get_playable_deck() 
	for i in range(5):
		var card_with_id = deck_ui.draw()
		enemy_deck_in_hand.add_card(card_with_id)

func _on_player_character_add_discard(type) -> void:
	if(type == "add"):
		var card_with_id = deck_ui.draw()
		player_deck_in_hand.add_card(card_with_id)
	else:
		player_deck_in_hand.removeRandomCard()

func _on_start_button_pressed() -> void:
	$"CanvasLayer/StartScreen".visible = false
	$EnemyDeckInHand/Hand.visible = false
	player_deck_in_hand.start()
	enemy_deck_in_hand.start()
	
	_on_deck_in_hand_starting()
