extends Node2D

@export var player_character: Character

@export var debug_mode: bool = true:
	set(value):
		if !is_node_ready():
			await ready

		debug_mode = value
		$InflictOneButton.visible = debug_mode
		$InflictThreeButton.visible = debug_mode
		#$DeckNHand.debug_mode = debug_mode

@onready var game_control:GameController = $GameController
@onready var deck_in_hand: Node2D = $DeckInHand
@onready var deck_ui: PlayableDeckUI = $PlayableDeckUi

@onready var player_deck : Deck = Deck.new()

var enemy_state: int = 0

func _ready() -> void:
	$DeckInHand.deck = player_deck
	pass

func _process(delta: float) -> void:
	if game_control.current_state == GameController.GameState.ENEMY_TURN:
		if enemy_state == 0:
			$MainScreen/EnemyCharacter.add_armor(0)
			$MainScreen/EnemyCharacter.take_damage(3)
		elif enemy_state == 1:
			$MainScreen/EnemyCharacter.add_armor(1)
			$MainScreen/EnemyCharacter.take_damage(2)
		elif enemy_state == 2:
			$MainScreen/EnemyCharacter.add_armor(2)
			$MainScreen/EnemyCharacter.take_damage(1)
	
		enemy_state += posmod(enemy_state + 1, 3)
		game_control.transition(GameController.GameState.PLAYER_TURN)

func _on_table_card_activated(card: UsableCard) -> void:
	var card_cost: int = card.get_cost()
	if game_control.current_state == GameController.GameState.PLAYER_TURN:
		card.activate({
		"caster": $MainScreen/PlayerCharacter,
		"targets": $MainScreen/EnemyCharacter
	})
	elif game_control.current_state == GameController.GameState.ENEMY_TURN:
		card.activate({
		"caster": $MainScreen/EnemyCharacter,
		"targets": $MainScreen/PlayerCharacter
	})

func _on_inflict_1_damage_pressed() -> void:
	player_character.take_damage(1)

func _on_inflict_3_damage_pressed() -> void:
	player_character.take_damage(3)

func _on_end_turn_pressed() -> void:
	if game_control.current_state == GameController.GameState.PLAYER_TURN:
		game_control.transition(GameController.GameState.ENEMY_TURN)


func _on_deck_in_hand_card_activated(card: UsableCard) -> void:
	var card_cost: int = card.getCost()
	card.activate({
	"caster": $MainScreen/PlayerCharacter,
	"targets": $MainScreen/EnemyCharacter
	})


func _on_playable_deck_ui_pressed() -> void:
	var card_with_id = deck_ui.draw()
	$DeckInHand.add_card(card_with_id)
	pass # Replace with function body.
