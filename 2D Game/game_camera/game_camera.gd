extends Camera2D


# 新建一个变量存储位置 先初始化二维向量为00
var target_position = Vector2.ZERO 

func _ready() -> void:
	# 强制该 Camera2D 成为当前的活动相机
	make_current()


func _process(delta: float) -> void:
	# 在运行过程中调用acquire_target()来持续获取位置
	acquire_target()
	# 相机的全局变量等于 全局变量的lerp，让相机可以有平滑效果，lerp不会受到帧率影响
	global_position = global_position.lerp(target_position, 1.0 - exp(-delta * 10))
	
func acquire_target():
	# 将设置的组的节点列表保存在player_node
	var player_node = get_tree().get_nodes_in_group("player")
	# 如果player_node获取到的列表大于0
	if player_node.size() > 0 :
		# 获取player_node第一个元素
		var player = player_node[0] as Node2D
		#使用target_position来接受player的全局位置
		target_position = player.global_position
