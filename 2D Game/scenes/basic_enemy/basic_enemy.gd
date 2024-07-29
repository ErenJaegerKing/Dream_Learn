extends CharacterBody2D

#设置最大速度
const MAX_SPEED = 75

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	# 设置变量获取玩家的方向
	var direction = get_direction_to_player()
	# 设置敌人移动的向量速度
	velocity = direction * MAX_SPEED
	# 让敌人移动起来
	move_and_slide()


func get_direction_to_player():
	# 获取玩家组player_node的第一个节点
	var player_node = get_tree().get_first_node_in_group("player") as Node2D
	# 合法性检查，确保player_node不为空
	if player_node != null:
		#返回玩家的全局位置减去敌人的全局位置,并将向量归一
		return (player_node.global_position - global_position).normalized()
	#如果player_node是NULL 返回归零的二维向量
	return Vector2.ZERO
