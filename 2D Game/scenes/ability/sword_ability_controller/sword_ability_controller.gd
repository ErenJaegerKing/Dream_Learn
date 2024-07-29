extends Node

# 创建个常量设定为范围
const MAX_RANGE = 150

# 定义变量sward_ability类型为PackedScene 可以在检查器中配置
@export var sward_ability: PackedScene

func _ready() -> void:
	# 引用节点添加timeout信号，并在信号发出后触发个事件
	$Timer.timeout.connect(on_timer_timeout)

func on_timer_timeout():
	# 确保玩家是存在的，否则就跳出
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player == null:
		return
		
	# 确保敌人是存在的，否则就跳出
	var enemies = get_tree().get_nodes_in_group("enemy")
	# 建立过滤器
	enemies = enemies.filter(func(enemy:Node2D):
			return enemy.global_position.distance_squared_to(player.global_position) < pow(MAX_RANGE,2)
	) # 上面是检查敌人与玩家距离的平方是否小于MAX_RANGE，距离大于150的过滤出去
	
	# 屏幕上没有敌人就跳出
	if enemies.size() == 0:
		return
	
	# 给敌人排序，返回敌人中距离玩家更近敌人
	enemies.sort_custom(func(a:Node2D,b:Node2D):
		var a_distance = a.global_position.distance_squared_to(player.global_position)
		var b_distance = b.global_position.distance_squared_to(player.global_position)
		return a_distance < b_distance
		)
	
	# 当敌人不为空的时候再创建实例
	# 创建剑实例的变量，并强制转换为Node2D
	var sword_instance = sward_ability.instantiate() as Node2D
	# 将剑加入main的场景树中去
	player.get_parent().add_child(sword_instance)
	# 生成剑的位置在距离玩家最近的敌人位置
	sword_instance.global_position = enemies[0].global_position
	
	#生成剑的位置 增加一个以4为半径的圆， 剑会沿着这个圆来生成
	sword_instance.global_position += Vector2.RIGHT.rotated(randf_range(0,TAU)) * 4
	
	# 敌人的位置减去剑的位置的向量
	var enemies_direction = enemies[0].global_position - sword_instance.global_position
	# 剑的旋转等于敌人的角度
	sword_instance.rotation = enemies_direction.angle()
