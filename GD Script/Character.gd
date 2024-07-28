class_name Character

extends Node

@export var profession : String #职业 类型 字符串
@export var health : int

func die():
	health = 0
	print(profession + "死亡！")

class Equipment:
	var armor := 50
	var weight := 10

var chest = Equipment.new()
var legs = Equipment.new()

func _ready() -> void:
	chest.armor = 20222
	print(chest.armor)
	print(legs.weight)
	
