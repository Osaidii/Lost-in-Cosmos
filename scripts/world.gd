extends Node2D

var coins: int
@export var required_coins := 500

@onready var required_label: Label = %Required
@onready var coins_label: Label = %Coins
@onready var player: Player = $Player
@export var MAIN_MENU = load("uid://dx7h1rxfqof3v")
@onready var CUTSCENE = load("uid://bxb0tmuhlci5o") as PackedScene

func _ready() -> void:
	required_label.text = str(required_coins)

func _process(_delta: float) -> void:
	if player:
		coins = player.stored_coins
		coins_label.text = str(coins)
	# Win Conditions
	if coins >= required_coins:
		Shortcuts.game_over = true
		get_tree().change_scene_to_packed(CUTSCENE)

func _on_exit_pressed() -> void:
	Shortcuts.game_over = false
	Shortcuts.coins = 0
	get_tree().change_scene_to_packed(MAIN_MENU)

func _on_replay_pressed() -> void:
	Shortcuts.game_over = false
	Shortcuts.coins = 0
