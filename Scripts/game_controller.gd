class_name GameController extends Node2D

enum GameState{
	PLAYER_TURN,
	ENEMY_TURN,
	ATTACK_TURN,
	GAME0VER,
	VICTORY
}

@onready var current_state: GameState = GameState.PLAYER_TURN

func transition(next_state: GameState):
	match current_state:
		GameState.PLAYER_TURN:
			pass
		GameState.ENEMY_TURN:
			pass
		GameState.ATTACK_TURN:
			pass
		GameState.GAME0VER:
			pass
		GameState.VICTORY:
			pass
	
	current_state = next_state
	
	match current_state:
		GameState.PLAYER_TURN:
			pass
		GameState.ENEMY_TURN:
			pass
		GameState.ATTACK_TURN:
			pass
		GameState.GAME0VER:
			pass
		GameState.VICTORY:
			pass


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
