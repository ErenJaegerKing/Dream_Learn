extends Node

# 创建数组变量类型为Abilityupgrade可以再检查器配置
@export var upgrade_pool : Array[Abilityupgrade]
@export var experience_manager : Node

# 创建一个当前升级的词典
var current_upgrade = {}

func _ready() -> void:
	#连接信号
	experience_manager.level_up.connect(on_level_up)

func on_level_up(current_level : int):
	# 随机取出技能列表中的一个
	var chosen_upgrade = upgrade_pool.pick_random() as Abilityupgrade
	# 比如没有技能选择，或者独特的技能只能选择一次，技能列表有可能为空，就返回
	if chosen_upgrade == null:
		return
	# 创建变量获取到字典中的其中一个
	var has_upgrade = current_upgrade.has(chosen_upgrade._id)
	
	# 如果获取到的技能不是已获取获取技能
	if !has_upgrade:
		#则获取这个技能并存下来，数量更新为1
		current_upgrade[chosen_upgrade._id] = {
			"resource" : chosen_upgrade,
			"quantity" : 1
		}
	#如果获取到技能是以获取技能，则获取数量+1
	else:
		current_upgrade[chosen_upgrade._id]["quantity"] += 1
	#测试后删除
	print(current_upgrade)
	
