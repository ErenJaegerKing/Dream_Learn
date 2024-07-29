extends Node

# 定义变量sward_ability类型为PackedScene 可以在检查器中配置
@export var sward_ability: PackedScene

func _ready() -> void:
	# 引用节点添加timeout信号，并在信号发出后触发个事件
	$Timer.timeout.connect(on_timer_timeout)

func on_timer_timeout():
	# 首先我们要确保玩家是存在的，否则就跳出
	var player = get_tree().get_first_node_in_group("player")
	#做判断主要是防止游戏出问题，这是在编程中必要的一种做法。
	#当玩家不存在跳出
	if player == null:
		return
	#当玩家不为空的时候再创建实例
	#创建剑实例的变量，并强制转换为Node2D
	var sword_instance = sward_ability.instantiate() as Node2D
	
	# 我们需要知道将实例生成在哪个场景下
	# 这里我们直生成实例在Player的父节点下
	player.get_parent().add_child(sword_instance)
	# 生成的剑实例位置等于玩家的全局位置
	sword_instance.global_position = player.global_position
