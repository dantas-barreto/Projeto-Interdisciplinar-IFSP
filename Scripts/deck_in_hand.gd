extends Node2D

signal card_activated(card: UsableCard)
signal table_card_activated(card: UsableCard)
signal starting

@export var deck: Deck

# debug
#@onready var attackCardScene: PackedScene = preload("res://Scenes/Cards/Debug/AttackCard.tscn")
#@onready var revivifyCardScene: PackedScene = preload("res://Scenes/Cards/Debug/RevivifyCard.tscn")
#@onready var defendCardScene: PackedScene = preload("res://Scenes/Cards/Debug/DefendCard.tscn")

# Spells
@onready var fireballCardScene: PackedScene = preload("res://Scenes/Cards/Spells/Fireball.tscn")
@onready var magicRainCardScene: PackedScene = preload("res://Scenes/Cards/Spells/MagicRain.tscn")
@onready var newWindsCardScene: PackedScene = preload("res://Scenes/Cards/Spells/NewWinds.tscn")
@onready var onFireCardScene: PackedScene = preload("res://Scenes/Cards/Spells/OnFire.tscn")
@onready var rageCardScene: PackedScene = preload("res://Scenes/Cards/Spells/Rage.tscn")
@onready var revitalizeCardScene: PackedScene = preload("res://Scenes/Cards/Spells/Revitalize.tscn")
@onready var stoneSkinCardScene: PackedScene = preload("res://Scenes/Cards/Spells/StoneSkin.tscn")
@onready var strongWindsCardScene: PackedScene = preload("res://Scenes/Cards/Spells/StrongWind.tscn")
@onready var waterOfLiteCardScene: PackedScene = preload("res://Scenes/Cards/Spells/WaterOfLife.tscn")
@onready var windBarrierCardScene: PackedScene = preload("res://Scenes/Cards/Spells/WindBarrier.tscn")

# Structures
@onready var flameTowerCardScene: PackedScene = preload("res://Scenes/Cards/Structures/FlameTower.tscn")
@onready var earthSoulCardScene: PackedScene = preload("res://Scenes/Cards/Structures/EarthSoul.tscn")
@onready var flameFortressCardScene: PackedScene = preload("res://Scenes/Cards/Structures/FlameFortress.tscn")
@onready var fortressCardScene: PackedScene = preload("res://Scenes/Cards/Structures/Fortress.tscn")
@onready var fountainOdLifeCardScene: PackedScene = preload("res://Scenes/Cards/Structures/FountainOfLife.tscn")
@onready var healthStoneCardScene: PackedScene = preload("res://Scenes/Cards/Structures/HealthStone.tscn")
@onready var mausoleumCardScene: PackedScene = preload("res://Scenes/Cards/Structures/Mausoleum.tscn")
@onready var swirlCardScene: PackedScene = preload("res://Scenes/Cards/Structures/Swirl.tscn")
@onready var waterMarkCardScene: PackedScene = preload("res://Scenes/Cards/Structures/WaterMark.tscn")

# Creatures
@onready var airGolemScene: PackedScene = preload("res://Scenes/Cards/Creatures/AirGolem.tscn")
@onready var armouredfireScene: PackedScene = preload("res://Scenes/Cards/Creatures/ArmouredFire.tscn")
@onready var dropletScene: PackedScene = preload("res://Scenes/Cards/Creatures/Droplet.tscn")
@onready var earthElementalScene: PackedScene = preload("res://Scenes/Cards/Creatures/EarthElemental.tscn")
@onready var earthGolemScene: PackedScene = preload("res://Scenes/Cards/Creatures/EarthGolem.tscn")
@onready var fireElementalScene: PackedScene = preload("res://Scenes/Cards/Creatures/FireElemental.tscn")
@onready var magicFireScene: PackedScene = preload("res://Scenes/Cards/Creatures/MagicFire.tscn")
@onready var stoneScene: PackedScene = preload("res://Scenes/Cards/Creatures/Stone.tscn")
@onready var twisterScene: PackedScene = preload("res://Scenes/Cards/Creatures/Twister.tscn")
@onready var waterElementalScene: PackedScene = preload("res://Scenes/Cards/Creatures/WaterElemental.tscn")
@onready var windElementalScene: PackedScene = preload("res://Scenes/Cards/Creatures/WindElemental.tscn")
@onready var windFairyScene: PackedScene = preload("res://Scenes/Cards/Creatures/WindFairy.tscn")


@onready var table: Table = $Table
@onready var hand: Hand = $Hand

func _ready(): 
	pass

func _process(delta):
	pass

func add_card(card_with_id: CardWithID):
	hand.add_card(card_with_id.card)

func reset():
	hand.empty_hand()

func removeRandomCard():
	hand.remove_card(randi_range(0,hand.hand.size()-1))

func start():
	for i in range(3): 
		#spells
		var fireball = fireballCardScene.instantiate()
		deck.add_card(fireball)
		var magicRain = magicRainCardScene.instantiate()
		deck.add_card(magicRain)
		var newWinds = newWindsCardScene.instantiate()
		deck.add_card(newWinds)
		var onFire = onFireCardScene.instantiate()
		deck.add_card(onFire)
		var rage = rageCardScene.instantiate()
		deck.add_card(rage)
		var revitalize = revitalizeCardScene.instantiate()
		deck.add_card(revitalize)
		var stoneSkin = stoneSkinCardScene.instantiate()
		deck.add_card(stoneSkin)
		var strongWinds = strongWindsCardScene.instantiate()
		deck.add_card(strongWinds)
		var waterOfLife = waterOfLiteCardScene.instantiate()
		deck.add_card(waterOfLife)
		var windBarrier = windBarrierCardScene.instantiate()
		deck.add_card(windBarrier)
		
		#Structures
		var flameTower = flameTowerCardScene.instantiate()
		deck.add_card(flameTower)
		var earthSoul = earthSoulCardScene.instantiate()
		deck.add_card(earthSoul)
		var flameFortress = flameFortressCardScene.instantiate()
		deck.add_card(flameFortress)
		var fortress = fortressCardScene.instantiate()
		deck.add_card(fortress)
		var fountainOdLife = fountainOdLifeCardScene.instantiate()
		deck.add_card(fountainOdLife)
		var healthStone = healthStoneCardScene.instantiate()
		deck.add_card(healthStone)
		var mausoleum = mausoleumCardScene.instantiate()
		deck.add_card(mausoleum)
		var swirl = swirlCardScene.instantiate()
		deck.add_card(swirl)
		var waterMark = waterMarkCardScene.instantiate()
		deck.add_card(waterMark)
		
		#creature
		var airGolem = airGolemScene.instantiate()
		deck.add_card(airGolem)
		var armouredFire = armouredfireScene.instantiate()
		deck.add_card(armouredFire)
		var droplet = dropletScene.instantiate()
		deck.add_card(droplet)
		var earthElemental = earthElementalScene.instantiate()
		deck.add_card(earthElemental)
		var earthGolem = earthGolemScene.instantiate()
		deck.add_card(earthGolem)
		var fireElemental = fireElementalScene.instantiate()
		deck.add_card(fireElemental)
		var magicFire = magicFireScene.instantiate()
		deck.add_card(magicFire)
		var stone = stoneScene.instantiate()
		deck.add_card(stone)
		var twister = twisterScene.instantiate()
		deck.add_card(twister)
		var waterElemental = waterElementalScene.instantiate()
		deck.add_card(waterElemental)
		var windElemental = windElementalScene.instantiate()
		deck.add_card(windElemental)
		var windFairy = windFairyScene.instantiate()
		deck.add_card(windFairy)

#func _on_attack_pressed():
#	var attackCard = attackCardScene.instantiate()
#	deck.add_card(attackCard)

#func _on_revivify_pressed():
#	var revivifyCard = revivifyCardScene.instantiate()
#	deck.add_card(revivifyCard)

#func _on_defend_pressed() -> void:
#	var defendCard = defendCardScene.instantiate()
#	deck.add_card(defendCard)

func _on_hand_card_transfer_to_table(card: UsableCard) -> void:
	hand.remove_card(hand.current_selected_card_index)
	if(card.get_type() == "spell"):
		card_activated.emit(card)
	elif(card.get_type() == "creature"):
		table.add_card(card)
	else:
		table.add_structure(card)

func _on_table_card_activated(card: UsableCard) -> void:
	card_activated.emit(card)
