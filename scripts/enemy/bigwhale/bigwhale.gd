extends EnemyTemplate
export(PackedScene) var bullet

onready var position_shoot: Position2D = get_node("Position2D")

func _ready() -> void:
	randomize()
	drop_list = {
		"Heal Potion": [
			"res://assets/item/consumable/health_potion.png", #Image Path Type
			20,                                               #Drop Probability
			"Health",                                         #Type
			5,                                                #Value
			2                                                 #Sell Price
		], 
		
		"Mana Potion": [
			"res://assets/item/consumable/mana_potion.png", 
			15, 
			"Mana", 
			5, 
			5
		],
		
		"Whale Mouth": [
			"res://assets/item/resource/whale/whale_mouth.png",
			45,
			"Resource",
			{},
			2
		],
		
		"Whale Eye": [
			"res://assets/item/resource/whale/whale_eye.png",
			15,
			"Resource",
			{},
			6
		],
		
		"Whale Tail": [
			"res://assets/item/resource/whale/whale_tail.png",
			3, 
			"Resource",
			{},
			25
		],
		
		"Whale Mask": [
			"res://assets/item/equipment/whale_mask.png",
			3, 
			"Equipment",
			{
				"Mana": 5,
				"Magic Attack": 3
			},
			30
		]
	}
func spawn_bullet() -> void:
	var projectile: Object = bullet.instance()
	get_tree().root.call_deferred("add_child", projectile)
	projectile.global_position = position_shoot.global_position