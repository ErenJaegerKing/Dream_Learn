extends Node

#设置敌人生成范围常量
const SPWNER_RADIUS = 380

# 创建一个容器来配置敌人
@export var basic_enemy_scene:PackedScene

func _ready() -> void:
	# 添加一个信号，当timeout的触发一个事件
	$Timer.timeout.connect(on_time_timeout)
	
func on_time_timeout():
	# 触发的事件
	# 先获取玩家,并判断是否有玩家
	var player = get_tree().get_first_node_in_group("player") as Node2D
	
	# 先要生成一个圆，这个圆在这个圆上产生一些随机位置
	var random_direction = Vector2.RIGHT.rotated(randf_range(0,TAU))
	# 以玩家位置为圆心 设置一个半径为SPAWNER_RADIUS的圆
	var spawner_position = player.global_position + (random_direction * SPWNER_RADIUS)
	
	# 获取basic_enemy_scene配置的场景节点
	var enemy = basic_enemy_scene.instantiate() as Node2D
	# 实例化敌人到main场景
	get_parent().add_child(enemy)
	# 设定怪物的生成位置
	enemy.global_position = spawner_position
